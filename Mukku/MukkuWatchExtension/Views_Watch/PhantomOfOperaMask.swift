import SwiftUI
import WidgetKit

struct PhantomOfOperaMask: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        
        switch widgetFamily {
            
        case .accessoryCircular:
            Image("mask_watch")
                .resizable()
                .scaledToFit()
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryRectangular:
            HStack {
                Image("mask_watch")
                    .resizable()
                    .scaledToFit()
                    .widgetAccentable(true)
                Text("Sing For Me!")
                Spacer()
            }
            .padding(.leading, 6)
            .unredacted()
            
        case .accessoryInline:
            Text("Sing For Me!")
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryCorner:
            Image("mask_watch")
                .resizable()
                .scaledToFit()
                .widgetLabel {
                    Text("Sing For Me!")
                        .widgetAccentable(true)
                }
                .unredacted()
            
        default:
            Text("Widget Not Supported)")
        }
    }
}


struct PhantomOfOperaMask_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaMask()
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        PhantomOfOperaMask()
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        PhantomOfOperaMask()
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        PhantomOfOperaMask()
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
    }
}

