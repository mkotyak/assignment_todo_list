import SwiftUI

struct ListItemModuleView: View {
    @StateObject private var viewModel: ListItemModuleViewModel

    init(viewModel: StateObject<ListItemModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        HStack {
            Image(systemName: viewModel.checkmarkImageName)
                .resizable()
                .frame(width: 20, height: 20)

            Text("\(viewModel.text)")
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .onTapGesture {
            viewModel.viewDidSelectToggleCompletionState()
        }
    }
}
