import Foundation
import SwiftUI

final class ListItemModuleBuilder {
    func view(item: ToDoItem) -> ListItemView {
        ListItemView(
            viewModel: StateObject(
                wrappedValue: ListItemModuleViewModel(
                    model: ListItemModuleModel(item: item)
                )
            )
        )
    }
}
