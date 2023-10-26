import SwiftUI

struct AddListItemView: View {
    @StateObject var viewModel: AddListItemModuleViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var isTextFieldFocused: Bool

    init(viewModel: StateObject<AddListItemModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack {
            textFieldView
            saveButton
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

    private var textFieldView: some View {
        TextField(
            "Type something here...",
            text: viewModel.newItemTextBinding
        )
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray)
        )
        .focused($isTextFieldFocused)
    }

    private var saveButton: some View {
        Button {
            viewModel.viewDidSelectSave()
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
    }
}
