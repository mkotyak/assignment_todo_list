import Foundation
import SwiftUI

final class ListItemModuleBuilder {
    func view(item: ToDoItem) -> ListItemModuleView {
        ListItemModuleView(
            viewModel: StateObject(
                wrappedValue: ListItemModuleViewModel(
                    model: ListItemModuleModel(
                        storageService: StorageService.shared,
                        item: item
                    )
                )
            )
        )
    }
}
