import SwiftUI
import ActivityKit
@main
struct MukkuApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
                MainView().environmentObject(ImageManager())
        }
    }
}
