import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(list: [
                .init(
                    id: .init(),
                    text: "Finish assignment",
                    isCompleted: false
                ),
                .init(
                    id: .init(),
                    text: "Bake a cake",
                    isCompleted: false
                )
            ])
        }
    }
}
