import Foundation

class DataManager {
    static let shared = DataManager()
    private let defaults = UserDefaults.standard

    // MARK: - Дефолтные данные
    private let defaultUser = User(
        name: "Мырзакул Бекарыс",
        age: 20,
        location: "Казахстан, Алматы",
        bio: "FullStack-разработчик, увлекаюсь AI и технологиями."
    )
    
    private let defaultHobbies = [
        Hobby(id: UUID(), icon: "🎹", name: "Пианино", description: "Люблю играть классику."),
        Hobby(id: UUID(), icon: "🎾", name: "Большой теннис", description: "Нравится играть с друзьями."),
        Hobby(id: UUID(), icon: "🏊", name: "Плавание", description: "Плавание полезно для здоровья.")
    ]
    
    private let defaultGoals = [
        Goal(id: UUID(), description: "2027 — Поступить в магистратуру заграницу"),
        Goal(id: UUID(), description: "2030 — Работать в топовой AI-компании"),
        Goal(id: UUID(), description: "2033 — Выйти на очень хороший постоянный доход")
    ]

    // MARK: - Универсальные методы
    private func saveData<T: Codable>(_ key: String, data: T) {
        if let encoded = try? JSONEncoder().encode(data) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    private func loadData<T: Codable>(_ key: String, defaultValue: T) -> T {
        guard let data = defaults.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return defaultValue
        }
        return decoded
    }

    // MARK: - Работа с пользователем
    func getUser() -> User {
        return loadData("user", defaultValue: defaultUser)
    }
    
    func saveUser(user: User) {
        saveData("user", data: user)
    }

    // MARK: - Работа с хобби
    func getHobbies() -> [Hobby] {
        return loadData("hobbies", defaultValue: defaultHobbies)
    }
    
    func saveHobbies(_ hobbies: [Hobby]) {
        saveData("hobbies", data: hobbies)
    }

    // MARK: - Работа с целями
    func getGoals() -> [Goal] {
        return loadData("goals", defaultValue: defaultGoals)
    }
    
    func saveGoals(_ goals: [Goal]) {
        saveData("goals", data: goals)
    }
}
