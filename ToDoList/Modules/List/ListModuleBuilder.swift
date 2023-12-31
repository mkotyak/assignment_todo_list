import SwiftUI

final class ListModuleBuilder {
    func view() -> ListModuleView {
        ListModuleView(
            viewModel: StateObject(
                wrappedValue: ListModuleViewModel(
                    model: ListModuleModel(
                        storageService: StorageService.shared
                    )
                )
            ),
            listItemModuleBuilder: .init(),
            addListItemModuleBuilder: .init()
        )
    }
}
