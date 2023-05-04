import WidgetKit
import SwiftUI
import Intents

struct MukkuWidgetsEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct MukkuWidgetsEntryView_Preview: PreviewProvider {
        static var previews: some View {
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "mask"))
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "boat"))
        }
    }

