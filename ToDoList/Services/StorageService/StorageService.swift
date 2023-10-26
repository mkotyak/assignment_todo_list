import Foundation

final class StorageService {
    private var storedItems: [ToDoItem] = []
    private lazy var queue = DispatchQueue(
        label: String(describing: self),
        attributes: .concurrent
    )

    static let shared: StorageService = .init()

    private init() {
        read()
    }

    private func read() {
        storedItems = [
            .init(text: "Finish assignment"),
            .init(text: "Bake a cake")
        ]
    }

    private func write() {
        // Write to the user defaults
    }
}

extension StorageService: StorageServiceProtocol {
    func items() -> [ToDoItem] {
        queue.sync {
            storedItems
        }
    }

    func add(newItem: ToDoItem) {
        queue.async(flags: .barrier) { [weak self] in
            self?.storedItems.append(newItem)
            self?.write()
        }
    }

    func update(isCompleted: Bool, for itemID: UUID) {
        queue.async(flags: .barrier) { [weak self] in
            guard let itemIndex = self?.storedItems.firstIndex(where: { $0.id == itemID }) else {
                return
            }

            self?.storedItems[itemIndex].isCompleted = isCompleted
            self?.write()
        }
    }
}
