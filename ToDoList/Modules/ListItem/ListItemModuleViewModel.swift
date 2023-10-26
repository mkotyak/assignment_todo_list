import Foundation

final class ListItemModuleViewModel: ObservableObject {
    @Published var model: ListItemModuleModel

    var text: String {
        model.item.text
    }

    var checkmarkImageName: String {
        model.item.isCompleted ? "checkmark.circle" : "circle"
    }

    init(model: ListItemModuleModel) {
        self.model = model
    }
}

// MARK: - Intents

extension ListItemModuleViewModel {
    func viewDidSelectToggleCompletionState() {
        model.toggleCompletionState()
    }
}
