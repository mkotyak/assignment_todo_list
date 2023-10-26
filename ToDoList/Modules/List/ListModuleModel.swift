import Foundation

struct ListModuleModel {
    private(set) var list: [ToDoItem] = []
    // private let storageService: StorageServiceProtocol

    private var availableItems: [ToDoItem] {
        // Retrieve list from storage
        [.init(
            id: .init(),
            text: "Finish assignment",
            isCompleted: false
        ),
        .init(
            id: .init(),
            text: "Bake a cake",
            isCompleted: false
        )]
    }

//    init(storageService: StorageServiceProtocol) {
//        self.storageService = storageService
//        list = availableItems
//    }

    init() {
        list = availableItems
    }

    mutating func reloadList() {
        list = availableItems
    }

    mutating func addItem(with text: String) {
        list.append(
            .init(
                id: .init(),
                text: text,
                isCompleted: false
            )
        )
    }

    mutating func deleteItem(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
}
