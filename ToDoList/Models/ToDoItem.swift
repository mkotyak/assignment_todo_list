import Foundation

struct ToDoItem: Identifiable {
    var id: UUID
    var text: String
    var isCompleted: Bool
}
