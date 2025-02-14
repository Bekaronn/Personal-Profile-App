import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    var name: String
    var age: Int
    var location: String
    var bio: String
}
