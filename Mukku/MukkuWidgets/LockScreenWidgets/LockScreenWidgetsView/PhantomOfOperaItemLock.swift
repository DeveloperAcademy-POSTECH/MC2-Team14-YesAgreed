import SwiftUI
import WidgetKit

struct PhantomOfOperaItemLock: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry : LockScreenSimpleEntry = LockScreenSimpleEntry()
    var body: some View {
        
        switch widgetFamily {
        case .accessoryCircular:
            Image("\(entry.scene)\(entry.count)")
                .resizable()
                .scaledToFit()
                .unredacted()
            
        case .accessoryRectangular:
            HStack {
                Image("\(entry.scene)\(entry.count)")
                    .resizable()
                    .scaledToFit()
                Text("Sing For Me!")
                Spacer()
            }
            .padding(.leading, 6)
            .unredacted()
            
        case .accessoryInline:
            Text("|  Sing For Me!")
                .unredacted()
            
        default:
            Text("Widget Not Supported)")
        }
        
        
    }
}


struct PhantomOfOperaItemLock_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}

