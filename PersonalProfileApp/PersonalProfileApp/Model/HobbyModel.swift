import Foundation

struct Hobby: Identifiable, Codable, Hashable {
    let id: UUID
    var icon: String
    var name: String
    var description: String

    init(id: UUID = UUID(), icon: String, name: String, description: String) {
        self.id = id
        self.icon = icon
        self.name = name
        self.description = description
    }
}
