import WidgetKit
import SwiftUI
import Intents

struct MukkuWidgetsEntryView : View {
    var entry: SimpleEntry
    var body: some View {
        switch entry.scene{
        case "mask":
            PhantomOfOperaMask(count: entry.count)
        case "boat":
            PhantomOfOperaBoat(count: entry.count)
        default:
            PhantomOfOperaMask(count: entry.count)
        }
    }
}

struct MukkuWidgetsEntryView_Preview: PreviewProvider {
        static var previews: some View {
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "mask"))
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "boat"))
        }
    }

