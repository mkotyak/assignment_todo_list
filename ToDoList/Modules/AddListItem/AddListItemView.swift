import SwiftUI

struct AddListItemView: View {
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal, 10)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.gray)
                )
                .focused($isTextFieldFocused)

            Button {
                dismiss()
            } label: {
                Text("Save")
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding(.top, 12)
        .padding(.horizontal, 12)
        .navigationTitle("Add an item")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isTextFieldFocused = true
        }
    }
}
