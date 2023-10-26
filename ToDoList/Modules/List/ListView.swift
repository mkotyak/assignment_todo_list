import SwiftUI

struct ListView: View {
    @StateObject private var viewModel: ListModuleViewModel

    init(viewModel: StateObject<ListModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.list) { item in
                    ListItemView(item: item)
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
