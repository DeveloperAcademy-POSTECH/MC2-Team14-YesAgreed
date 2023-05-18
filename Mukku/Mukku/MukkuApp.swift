import SwiftUI

@main
struct MukkuApp: App {
    var body: some Scene {
        WindowGroup {
                MainView().environmentObject(ImageManager())
        }
    }
}
