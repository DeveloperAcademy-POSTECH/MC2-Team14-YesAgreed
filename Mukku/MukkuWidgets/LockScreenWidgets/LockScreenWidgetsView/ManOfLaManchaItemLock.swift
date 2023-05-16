import SwiftUI
import WidgetKit

struct ManOfLaManchaItemLock: View {
    
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
                Text("The Impossible Dream")
                    .font(.system(size: 13))
                Spacer()
            }
            .padding(.leading, 6)
            .unredacted()
            
        case .accessoryInline:
            Text("|  The Impossible Dream")
                .unredacted()
            
        default:
            Text("Widget Not Supported)")
        }
        
        
    }
}


struct ManOfLaManchaItemLock_Previews: PreviewProvider {
    static var previews: some View {
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}

