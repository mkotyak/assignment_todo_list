import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(list: [
                .init(
                    id: .init(),
                    text: "One",
                    isCompleted: false
                ),
                .init(
                    id: .init(),
                    text: "Two",
                    isCompleted: false
                ),
                .init(
                    id: .init(),
                    text: "Three",
                    isCompleted: false
                ),
            ])
        }
    }
}
