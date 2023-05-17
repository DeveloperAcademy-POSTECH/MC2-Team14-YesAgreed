import WidgetKit
import SwiftUI
import Intents

struct MukkuLockScreenWidgets: Widget {
    let kind: String = "MukkuLockScreenWidgets"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: ConfigurationLockScreenIntent.self,
            provider: LockScreenProvider()) { entry in
                MukkuLockScreenWidgetsEntryView(entry: entry)
            }
            .configurationDisplayName("Mukku")
            .supportedFamilies([.accessoryInline, .accessoryCircular, .accessoryRectangular])
    }
}
