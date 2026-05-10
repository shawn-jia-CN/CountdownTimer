import Foundation

class DataManager {
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys {
        static let targetDate = "targetDate"
        static let lastClickDate = "lastClickDate"
        static let streakStartDate = "streakStartDate"
    }
    
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
}
