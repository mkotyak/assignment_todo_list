import Foundation

struct ListModuleModel {
    private let storageService: StorageServiceProtocol
    private(set) var items: [ToDoItem] = []

    private var availableItems: [ToDoItem] {
        storageService.items()
    }

    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
        items = availableItems
    }

    mutating func reloadList() {
        items = availableItems
    }

    mutating func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
