import SwiftUI

struct ListView: View {
    @StateObject private var viewModel: ListModuleViewModel
    private let listItemModuleBuilder: ListItemModuleBuilder

    init(
        viewModel: StateObject<ListModuleViewModel>,
        listItemModuleBuilder: ListItemModuleBuilder
    ) {
        self._viewModel = viewModel
        self.listItemModuleBuilder = listItemModuleBuilder
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.list) { item in
                    listItemModuleBuilder.view(item: item)
                }
                .onDelete { index in
                    viewModel.viewDidSelectDeleteItem(at: index)
                }
            }
            .listStyle(.plain)
            .navigationTitle("To-Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                trailing: NavigationLink(destination: AddListItemView()) {
                    Image(systemName: "plus")
                        .resizable()
                }
            )
            .onAppear {
                viewModel.viewDidAppear()
            }
        }
        .accentColor(.black)
    }
}
