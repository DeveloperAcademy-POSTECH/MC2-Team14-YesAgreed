import WidgetKit
import SwiftUI

struct Mc2WidgetsEntryView : View {
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


struct MCcWidgetsEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Mc2WidgetsEntryView(entry: SimpleEntry(scene: "mask"))
        Mc2WidgetsEntryView(entry: SimpleEntry(scene: "boat"))
    }
}
