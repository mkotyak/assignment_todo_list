import Foundation

final class ListModuleViewModel: ObservableObject {
    @Published var model: ListModuleModel

    var list: [ToDoItem] {
        model.items
    }

    init(model: ListModuleModel) {
        self.model = model
    }
}

// MARK: Intents

extension ListModuleViewModel {
    func viewDidAppear() {
        model.reloadList()
    }

    func viewDidSelectDeleteItem(at offsets: IndexSet) {
        model.deleteItem(at: offsets)
    }
}
