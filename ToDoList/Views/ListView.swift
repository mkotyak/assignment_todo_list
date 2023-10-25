import SwiftUI

struct ListView: View {
    @State var list: [ToDoItem]
    @State var newListItemText: String = ""

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
                trailing: NavigationLink(destination: AddListItemView(textFieldText: $newListItemText)) {
                    Image(systemName: "plus")
                        .resizable()
                }
            )
            .onAppear {
                guard !newListItemText.isEmpty else {
                    return
                }

                createItem(with: newListItemText)
                newListItemText = ""
            }
        }
        .accentColor(.black)
    }

    private func deleteItem(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }

    private func createItem(with text: String) {
        list.append(
            .init(
                id: .init(),
                text: text,
                isCompleted: false
            )
        )
    }
}
