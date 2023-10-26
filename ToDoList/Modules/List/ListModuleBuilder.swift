import SwiftUI

final class ListModuleBuilder {
    func view() -> ListModuleView {
        ListModuleView(
            viewModel: StateObject(
                wrappedValue: ListModuleViewModel(
                    model: ListModuleModel()
                )
            ),
            listItemModuleBuilder: .init(),
            addListItemModuleBuilder: .init()
        )
    }
}
