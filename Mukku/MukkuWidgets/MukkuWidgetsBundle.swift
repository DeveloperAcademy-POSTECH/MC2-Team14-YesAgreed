import WidgetKit
import SwiftUI

@main
struct MukkuWidgetsBundle: WidgetBundle {
    var body: some Widget {
        MukkuWidgets()
        MukkuLockScreenWidgets()
        MukkuWidgetsLiveActivity()
    }
}
