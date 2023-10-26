import Foundation
import SwiftUI

final class AddListItemModuleViewModel: ObservableObject {
    @Published private var model: AddListItemModuleModel

    var newItemTextBinding: Binding<String> {
        return Binding<String> { [weak self] in
            self?.model.newItemText ?? ""
        } set: { [weak self] newValue, _ in
            self?.model.newItemText = newValue
        }
    }

    var isSaveDisabled: Bool {
        newItemTextBinding.wrappedValue.isEmpty
    }

    init(model: AddListItemModuleModel) {
        self.model = model
    }
}

// MARK: Intents

extension AddListItemModuleViewModel {
    func viewDidSelectSave() {
        model.save()
    }
}
