import SwiftUI

class ThemeManager {
    static let shared = ThemeManager()

    private let key = "isDarkMode"

    var isDarkMode: Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    func setDarkMode(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
