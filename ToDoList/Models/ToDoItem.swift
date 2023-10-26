import Foundation

struct ToDoItem: Identifiable, Codable {
    var id: UUID
    var text: String
    var isCompleted: Bool

    init(text: String) {
        self.id = UUID()
        self.text = text
        self.isCompleted = false
    }
}
