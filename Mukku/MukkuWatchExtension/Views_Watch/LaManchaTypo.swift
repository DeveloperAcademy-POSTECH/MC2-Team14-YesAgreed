import SwiftUI
import WidgetKit

struct LaManchaTypo: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.widgetRenderingMode) var widgetRenderingMode
    var body: some View {
        
        switch widgetFamily {
            
        case .accessoryCircular:
            Image("typo_watch")
                .resizable()
                .scaledToFit()
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryRectangular:
            HStack {
                Image("typo_watch")
                    .resizable()
                    .scaledToFit()
                    .widgetAccentable(true)
                Text("The Impossible Dream")
                Spacer()
            }
            .padding(.leading, 6)
            .unredacted()
            
        case .accessoryInline:
            Text("The Impossible Dream")
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryCorner:
            Image("typo_watch")
                .resizable()
                .scaledToFit()
                .widgetLabel {
                    Text("The Impossible Dream")
                        .widgetAccentable(true)
                }
                .unredacted()
            
        default:
            Text("Widget Not Supported)")
        }
    }
}


struct LaManchaTypo_Previews: PreviewProvider {
    static var previews: some View {
        LaManchaTypo()
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        LaManchaTypo()
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        LaManchaTypo()
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        LaManchaTypo()
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
    }
}

