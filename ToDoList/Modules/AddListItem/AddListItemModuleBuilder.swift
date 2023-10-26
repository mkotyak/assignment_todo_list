import Foundation
import SwiftUI

final class AddListItemModuleBuilder {
    func view() -> AddListItemModuleView {
        AddListItemModuleView(
            viewModel: StateObject(
                wrappedValue: AddListItemModuleViewModel(
                    model: AddListItemModuleModel(
                        storageService: StorageService.shared
                    )
                )
            )
        )
    }
}
