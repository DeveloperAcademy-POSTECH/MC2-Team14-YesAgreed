import WidgetKit
import SwiftUI
import Intents

struct MukkuWidgetsEntryView : View {
    var entry: SimpleEntry
    var body: some View {
//        switch entry.scene{
//        case "mask","boat","rose","chandelier" :
//            PhantomOfOperaItem(entry: entry, transparentBackground: Helper.getImageFromUserDefaults(key: imageID))
//        default:
//            ManOfLaManchaItem(entry: entry, transparentBackground: Helper.getImageFromUserDefaults(key: imageID))
//        }
//        if let imageID = entry.imageID {
        switch entry.scene{
        case "mask","boat","rose","chandelier" :
            PhantomOfOperaItem(entry: entry)
        default:
            ManOfLaManchaItem(entry: entry)
        }
                
//        } else {
//            switch entry.scene{
//            case "mask","boat","rose","chandelier" :
//                PhantomOfOperaItem(entry: entry, imageID: nil)
//            default:
//                ManOfLaManchaItem(entry: entry, imageID: nil)
//
//            }
//        }
    }
}

struct MukkuWidgetsEntryView_Preview: PreviewProvider {
        static var previews: some View {
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "mask"))
            MukkuWidgetsEntryView(entry: SimpleEntry(scene: "boat"))
        }
    }

