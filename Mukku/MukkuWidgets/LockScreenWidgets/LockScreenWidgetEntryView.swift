import WidgetKit
import SwiftUI
import Intents

struct MukkuLockScreenWidgetsEntryView : View {
    var entry: LockScreenSimpleEntry
    var body: some View {
        switch entry.scene{
        case "mask","boat","rose","chandelier" :
            PhantomOfOperaItemLock(entry: entry)
        default:
            ManOfLaManchaItemLock(entry: entry)
        }
    }
}
