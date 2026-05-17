import AppKit

class CountdownWindow: NSWindow {
    
    private let dataManager: DataManager
    private var timer: Timer?
    private var countdownLabel: NSTextField!
    private var streakLabel: NSTextField!
    private var lastClickLabel: NSTextField!
    private var targetDateLabel: NSTextField!
    private var encouragementLabel: NSTextField!
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        
        let windowRect = NSRect(x: 0, y: 0, width: 320, height: 320)
        super.init(
            contentRect: windowRect,
            styleMask: [.titled, .closable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        
        setupWindow()
        setupUI()
        startTimer()
    }
    
    private func setupWindow() {
        self.title = "Countdown Timer"
        self.level = .floating
        self.isMovableByWindowBackground = true
        self.titlebarAppearsTransparent = true
        self.titleVisibility = .visible
        self.backgroundColor = NSColor.windowBackgroundColor
        self.center()
        self.isReleasedWhenClosed = false
    }
    
    private func setupUI() {
        guard let contentView = self.contentView else { return }
        
        let containerView = NSView(frame: contentView.bounds)
        containerView.autoresizingMask = [.width, .height]
        contentView.addSubview(containerView)
        
        let titleLabel = createLabel(text: "⏱️ Countdown Timer", fontSize: 20, bold: true)
        titleLabel.frame = NSRect(x: 20, y: 270, width: 280, height: 30)
        containerView.addSubview(titleLabel)
        
        let separator1 = createSeparator(y: 255)
        containerView.addSubview(separator1)
        
        let countdownTitleLabel = createLabel(text: "距离目标日期还有：", fontSize: 14, bold: false)
        countdownTitleLabel.textColor = .secondaryLabelColor
        countdownTitleLabel.frame = NSRect(x: 20, y: 220, width: 280, height: 20)
        containerView.addSubview(countdownTitleLabel)
        
        countdownLabel = createLabel(text: "计算中...", fontSize: 24, bold: true)
        countdownLabel.textColor = .systemBlue
        countdownLabel.frame = NSRect(x: 20, y: 185, width: 280, height: 30)
        containerView.addSubview(countdownLabel)
        
        targetDateLabel = createLabel(text: "", fontSize: 11, bold: false)
        targetDateLabel.textColor = .tertiaryLabelColor
        targetDateLabel.frame = NSRect(x: 20, y: 165, width: 280, height: 15)
        containerView.addSubview(targetDateLabel)
        
        let separator2 = createSeparator(y: 150)
        containerView.addSubview(separator2)
        
        let streakTitleLabel = createLabel(text: "💪 你已坚持：", fontSize: 14, bold: false)
        streakTitleLabel.textColor = .secondaryLabelColor
        streakTitleLabel.frame = NSRect(x: 20, y: 115, width: 280, height: 20)
        containerView.addSubview(streakTitleLabel)
        
        streakLabel = createLabel(text: "0 天", fontSize: 24, bold: true)
        streakLabel.textColor = .systemGreen
        streakLabel.frame = NSRect(x: 20, y: 80, width: 280, height: 30)
        containerView.addSubview(streakLabel)
        
        let separator3 = createSeparator(y: 65)
        containerView.addSubview(separator3)
        
        lastClickLabel = createLabel(text: "", fontSize: 11, bold: false)
        lastClickLabel.textColor = .tertiaryLabelColor
        lastClickLabel.frame = NSRect(x: 20, y: 40, width: 280, height: 15)
        containerView.addSubview(lastClickLabel)
        
        let separator4 = createSeparator(y: 25)
        containerView.addSubview(separator4)
        
        encouragementLabel = createLabel(text: "", fontSize: 13, bold: true)
        encouragementLabel.textColor = .systemOrange
        encouragementLabel.frame = NSRect(x: 20, y: 0, width: 280, height: 20)
        containerView.addSubview(encouragementLabel)
        
        updateDisplay()
        encouragementLabel.stringValue = dataManager.getRandomEncouragement()
    }
    
    private func createLabel(text: String, fontSize: CGFloat, bold: Bool) -> NSTextField {
        let label = NSTextField(labelWithString: text)
        label.font = bold ? NSFont.boldSystemFont(ofSize: fontSize) : NSFont.systemFont(ofSize: fontSize)
        label.alignment = .center
        label.isEditable = false
        label.isSelectable = false
        label.isBordered = false
        label.backgroundColor = .clear
        return label
    }
    
    private func createSeparator(y: CGFloat) -> NSBox {
        let separator = NSBox(frame: NSRect(x: 20, y: y, width: 280, height: 1))
        separator.boxType = .separator
        return separator
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateCountdownOnly()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func refreshView() {
        updateDisplay()
        encouragementLabel.stringValue = dataManager.getRandomEncouragement()
    }
    
    private func updateCountdownOnly() {
        if let components = dataManager.getCountdownComponents() {
            countdownLabel.stringValue = "\(components.days) 天 \(components.hours) 小时 \(components.minutes) 分钟 \(components.seconds) 秒"
        } else {
            countdownLabel.stringValue = "未设置目标日期"
        }
        
        let streakDays = dataManager.getStreakDays()
        streakLabel.stringValue = "\(streakDays) 天"
        
        if let targetDate = dataManager.getTargetDate() {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            targetDateLabel.stringValue = "目标日期: \(formatter.string(from: targetDate))"
        }
        
        if let lastClick = dataManager.getLastClickDate() {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            lastClickLabel.stringValue = "上次记录: \(formatter.string(from: lastClick))"
        } else {
            lastClickLabel.stringValue = "点击菜单栏图标记录坚持天数"
        }
    }
    
    private func updateDisplay() {
        updateCountdownOnly()
    }
    
    deinit {
        timer?.invalidate()
    }
}
