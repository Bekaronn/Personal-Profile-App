import Foundation

struct Goal: Identifiable, Codable, Hashable {
    let id: UUID
    var description: String

    init(id: UUID = UUID(), description: String) {
        self.id = id
        self.description = description
    }
}
