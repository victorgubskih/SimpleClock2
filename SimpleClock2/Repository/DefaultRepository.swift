import Foundation
import UIKit

class DefaultRepository: Repository {
    func save(clocks: [Clock]) {

    }

    func clocks() -> [Clock] {
        return []
    }

    private static let userKeySelectedColor = "selectedColor"
    private static let userKeyTimeZone = "selectedTimeZone"
    private static let userKeyClock = "ClockPreviewKey"

    private let userDefaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func save(preview: ClockViewFactory.Preview) {
        userDefaults.set(preview.rawValue, forKey: Self.userKeyClock)
    }

    func save(color: UIColor) {
        if let data = try? encoder.encode(color) {
            userDefaults.set(data, forKey: Self.userKeySelectedColor)
        }
    }

    func save(timeZone: TimeZone) {
        userDefaults.set(timeZone.identifier, forKey: Self.userKeyTimeZone)
    }

    func preview() -> ClockViewFactory.Preview? {
        guard let previewStr = userDefaults.string(forKey: Self.userKeyClock), let preview = ClockViewFactory.Preview(rawValue: previewStr) else {
            return nil
        }
        return preview
    }

    func color() -> UIColor? {
        guard let colorData = userDefaults.data(forKey: Self.userKeySelectedColor), let color = try? decoder.decode(UIColor.self, from: colorData) else {
            return nil
        }
        return color
    }
    
    func timeZone() -> TimeZone? {
        guard let identifier = userDefaults.string(forKey: Self.userKeyTimeZone), let timeZone = TimeZone(identifier: identifier) else {
            return nil
        }
        return timeZone
    }
}
