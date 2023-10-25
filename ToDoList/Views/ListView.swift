import SwiftUI

struct ListView: View {
    @State var list: [ToDoItem]

    var body: some View {
        List {
            ForEach(list) { item in
                ListItemView(item: item)
            }
        }
        .listStyle(.plain)
    }
}
