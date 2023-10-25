import SwiftUI

struct ListItemView: View {
    @State var item: ToDoItem

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 20, height: 20)

            Text("\(item.text)")
                .font(.caption)
                .foregroundColor(.black)
        }
        .onTapGesture {
            toggleCompletionState()
        }
    }

    private func toggleCompletionState() {
        item.isCompleted.toggle()
    }
}
