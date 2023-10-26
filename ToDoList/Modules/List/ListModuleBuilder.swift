import SwiftUI

final class ListModuleBuilder {
    func view() -> ListView {
        ListView(
            viewModel: StateObject(
                wrappedValue: ListModuleViewModel(
                    model: ListModuleModel()
                )
            ),
            listItemModuleBuilder: .init()
        )
    }
}
