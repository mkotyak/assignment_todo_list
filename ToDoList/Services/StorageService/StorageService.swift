import Foundation

final class StorageService {
    private enum Constants {
        static var storageKey: String { "ToDoItems" }
    }

    private var storedItems: [ToDoItem] = []

    private lazy var queue = DispatchQueue(
        label: String(describing: self),
        attributes: .concurrent
    )

    private lazy var userDefaults: UserDefaults = .standard

    static let shared: StorageService = .init()

    private init() {
        read()
    }

    private func read() {
        let decoder = JSONDecoder()

        guard let data = userDefaults.data(forKey: Constants.storageKey) else {
            storedItems = []
            return
        }

        do {
            storedItems = try decoder.decode([ToDoItem].self, from: data)
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    private func write() {
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(storedItems)
            userDefaults.set(data, forKey: Constants.storageKey)
        } catch {
            assertionFailure(error.localizedDescription)
        }
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

    func delete(at offsets: IndexSet) {
        queue.async(flags: .barrier) { [weak self] in
            guard
                let self,
                !storedItems.isEmpty
            else {
                return
            }

            storedItems.remove(atOffsets: offsets)
            write()
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
