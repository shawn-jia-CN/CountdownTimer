import Foundation

class DataManager {
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys {
        static let targetDate = "targetDate"
        static let lastClickDate = "lastClickDate"
        static let streakStartDate = "streakStartDate"
    }
    
    private let encouragements = [
        "加油！你正在努力！💪",
        "坚持就是胜利！🌟",
        "每一天都在进步！✨",
        "相信自己，你可以的！🎯",
        "继续努力，美好的结果等着你！🏆",
        "你比你想象的更强大！💫",
        "保持专注，你正在接近目标！🎯",
        "不要放弃，成功就在眼前！🌈",
        "你是最棒的！⭐",
        "继续前进，未来可期！🚀",
        "小小的进步也是进步！📈",
        "你的努力不会白费！💎",
        "坚持到底就是胜利！🏅",
        "每一天都是新的开始！🌅",
        "你正在创造奇迹！🌟",
        "保持热情，继续前行！🔥",
        "成功属于坚持的人！👑",
        "你值得为自己的努力骄傲！🎖️",
        "一步一步，接近目标！🎯",
        "今天也要元气满满！⚡"
    ]
    
    func getTargetDate() -> Date? {
        return userDefaults.object(forKey: Keys.targetDate) as? Date
    }
    
    func setTargetDate(_ date: Date) {
        userDefaults.set(date, forKey: Keys.targetDate)
    }
    
    func getLastClickDate() -> Date? {
        return userDefaults.object(forKey: Keys.lastClickDate) as? Date
    }
    
    func setLastClickDate(_ date: Date) {
        userDefaults.set(date, forKey: Keys.lastClickDate)
    }
    
    func getStreakStartDate() -> Date? {
        return userDefaults.object(forKey: Keys.streakStartDate) as? Date
    }
    
    func setStreakStartDate(_ date: Date) {
        userDefaults.set(date, forKey: Keys.streakStartDate)
    }
    
    func getStreakDays() -> Int {
        guard let startDate = getStreakStartDate() else {
            return 0
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: Date())
        return max(0, components.day ?? 0)
    }
    
    func getCountdownComponents() -> (days: Int, hours: Int, minutes: Int, seconds: Int)? {
        guard let targetDate = getTargetDate() else {
            return nil
        }
        
        let now = Date()
        let interval = targetDate.timeIntervalSince(now)
        
        if interval <= 0 {
            return (0, 0, 0, 0)
        }
        
        let totalSeconds = Int(interval)
        let days = totalSeconds / 86400
        let hours = (totalSeconds % 86400) / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        return (days, hours, minutes, seconds)
    }
    
    func getRandomEncouragement() -> String {
        return encouragements.randomElement() ?? "加油！💪"
    }
}
