import Foundation

struct AddListItemModuleModel {
    private let storageService: StorageServiceProtocol
    var newItemText: String = ""

    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }

    func save() {
        storageService.add(newItem: .init(
            text: newItemText
        ))
    }
}
