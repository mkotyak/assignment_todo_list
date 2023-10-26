import Foundation

struct ListModuleModel {
    private(set) var items: [ToDoItem] = []
    // private let storageService: StorageServiceProtocol

    private var availableItems: [ToDoItem] {
        // Retrieve list from storage
        [
            .init(text: "Finish assignment"),
            .init(text: "Bake a cake")
        ]
    }

//    init(storageService: StorageServiceProtocol) {
//        self.storageService = storageService
//        list = availableItems
//    }

    init() {
        items = availableItems
    }

    mutating func reloadList() {
        items = availableItems
    }

    mutating func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
