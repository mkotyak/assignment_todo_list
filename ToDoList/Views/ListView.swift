import SwiftUI

struct ListView: View {
    @State var list: [ToDoItem]

    var body: some View {
        NavigationView {
            List {
                ForEach(list) { item in
                    ListItemView(item: item)
                }
                .onDelete(perform: deleteItem)
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
        }
        .accentColor(.black)
    }

    private func deleteItem(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
}
