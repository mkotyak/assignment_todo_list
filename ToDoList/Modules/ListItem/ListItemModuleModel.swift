import Foundation

struct ListItemModuleModel {
    private(set) var item: ToDoItem {
        didSet {
            // save updated togle state
        }
    }

    // private let storageService: storageServiceProtocol

    init(item: ToDoItem) {
        self.item = item
    }

    mutating func toggleCompletionState() {
        item.isCompleted.toggle()
    }
}
