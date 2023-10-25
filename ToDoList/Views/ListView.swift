import SwiftUI

struct ListView: View {
    @State var list: [ToDoItem]

    var body: some View {
        List {
            ForEach(list) { item in
                ListItemView(item: item)
            }
            .onDelete(perform: deleteItem)
        }
        .listStyle(.plain)
    }

    private func deleteItem(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
}
