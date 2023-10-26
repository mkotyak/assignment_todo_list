import Foundation
import SwiftUI

final class AddListItemModuleBuilder {
    func view() -> AddListItemView {
        AddListItemView(
            viewModel: StateObject(
                wrappedValue: AddListItemModuleViewModel(
                    model: AddListItemModuleModel()
                )
            )
        )
    }
}
