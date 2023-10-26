import Foundation

struct ListItemModuleModel {
    private let storageService: StorageServiceProtocol
    private(set) var item: ToDoItem {
        didSet {
            storageService.update(
                isCompleted: item.isCompleted,
                for: item.id
            )
        }
    }

    init(
        storageService: StorageServiceProtocol,
        item: ToDoItem
    ) {
        self.storageService = storageService
        self.item = item
    }

    mutating func toggleCompletionState() {
        item.isCompleted.toggle()
    }
}
