import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!
    private var countdownWindow: CountdownWindow?
    private let dataManager = DataManager()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusItem()
        setupDefaultTargetDate()
    }
    
    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "timer", accessibilityDescription: "Countdown Timer")
            button.action = #selector(toggleCountdownWindow)
            button.target = self
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "显示倒计时", action: #selector(toggleCountdownWindow), keyEquivalent: "t"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "设置目标日期", action: #selector(setTargetDate), keyEquivalent: "s"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "退出", action: #selector(quitApp), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    private func setupDefaultTargetDate() {
        if dataManager.getTargetDate() == nil {
            let calendar = Calendar.current
            var components = DateComponents()
            components.year = 2025
            components.month = 12
            components.day = 31
            if let defaultDate = calendar.date(from: components) {
                dataManager.setTargetDate(defaultDate)
            }
        }
    }
    
    @objc private func toggleCountdownWindow() {
        if countdownWindow == nil {
            countdownWindow = CountdownWindow(dataManager: dataManager)
        }
        
        if countdownWindow!.isVisible {
            countdownWindow!.orderOut(nil)
        } else {
            countdownWindow!.showWindow(nil)
            updateStreak()
        }
    }
    
    private func updateStreak() {
        let lastClick = dataManager.getLastClickDate()
        let now = Date()
        
        if lastClick == nil {
            dataManager.setStreakStartDate(now)
        }
        
        dataManager.setLastClickDate(now)
        countdownWindow?.refreshView()
    }
    
    @objc private func setTargetDate() {
        let alert = NSAlert()
        alert.messageText = "设置目标日期"
        alert.informativeText = "请选择目标日期："
        alert.alertStyle = .informational
        alert.addButton(withTitle: "确定")
        alert.addButton(withTitle: "取消")
        
        let datePicker = NSDatePicker(frame: NSRect(x: 0, y: 0, width: 200, height: 30))
        datePicker.datePickerStyle = .textFieldAndStepper
        datePicker.datePickerElements = .yearMonthDay
        datePicker.dateValue = dataManager.getTargetDate() ?? Date()
        
        alert.accessoryView = datePicker
        
        let response = alert.runModal()
        if response == .alertFirstButtonReturn {
            dataManager.setTargetDate(datePicker.dateValue)
            countdownWindow?.refreshView()
        }
    }
    
    @objc private func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}
