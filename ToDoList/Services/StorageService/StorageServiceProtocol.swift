import Foundation

protocol StorageServiceProtocol {
    func items() -> [ToDoItem]
    func add(newItem: ToDoItem)
    func delete(at offsets: IndexSet)
    func update(isCompleted: Bool, for itemID: UUID)
}
