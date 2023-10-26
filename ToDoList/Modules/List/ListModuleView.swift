import SwiftUI

struct ListModuleView: View {
    @StateObject private var viewModel: ListModuleViewModel

    private let listItemModuleBuilder: ListItemModuleBuilder
    private let addListItemModuleBuilder: AddListItemModuleBuilder

    init(
        viewModel: StateObject<ListModuleViewModel>,
        listItemModuleBuilder: ListItemModuleBuilder,
        addListItemModuleBuilder: AddListItemModuleBuilder
    ) {
        self._viewModel = viewModel
        self.listItemModuleBuilder = listItemModuleBuilder
        self.addListItemModuleBuilder = addListItemModuleBuilder
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.hasItems {
                    listView
                } else {
                    emptyListView
                }
            }
            .navigationTitle("To-Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                trailing: NavigationLink(destination: addListItemModuleBuilder.view()) {
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

    private var listView: some View {
        List {
            ForEach(viewModel.list) { item in
                listItemModuleBuilder.view(item: item)
            }
            .onDelete { index in
                viewModel.viewDidSelectDeleteItem(at: index)
            }
        }
        .listStyle(.plain)
    }

    private var emptyListView: some View {
        Text("No Items")
            .foregroundColor(.gray)
            .font(.subheadline)
    }
}
