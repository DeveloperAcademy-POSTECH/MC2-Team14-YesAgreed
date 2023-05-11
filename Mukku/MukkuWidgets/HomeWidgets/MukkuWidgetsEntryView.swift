import WidgetKit
import SwiftUI
import Intents

struct MukkuWidgetsEntryView : View {
    var entry: SimpleEntry
    var body: some View {
        switch entry.scene{
        case "mask","boat","rose","chandelier" :
            PhantomOfOperaItem(entry: entry)
        default:
            ManOfLaManchaItem(entry: entry)
        }
    }
}

struct MukkuWidgetsEntryView_Preview: PreviewProvider {
        static var previews: some View {
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "mask"))
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "boat"))
        }
    }

