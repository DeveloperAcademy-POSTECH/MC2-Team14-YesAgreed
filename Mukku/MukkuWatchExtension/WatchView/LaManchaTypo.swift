import SwiftUI
import WidgetKit

struct LaManchaTypo: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.widgetRenderingMode) var widgetRenderingMode
    
    var body: some View {
        
        switch widgetFamily {
        case .accessoryCircular:
            switch widgetRenderingMode {
            case .fullColor:
                Image("typo_watch_full")
                    .resizable()
                    .scaledToFit()
                    .widgetAccentable(true)
                    .unredacted()
            default:
                Image("typo_watch")
                    .resizable()
                    .scaledToFit()
                    .widgetAccentable(true)
                    .unredacted()
            }
            
        case .accessoryRectangular:
            switch widgetRenderingMode {
            case .fullColor:
                HStack {
                    Image("typo_watch_full")
                        .resizable()
                        .scaledToFit()
                        .widgetAccentable(true)
                        .padding(4)
                    Text("The Impossible Dream")
                    Spacer()
                }
                .padding(.leading, 6)
                .unredacted()
            default:
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
            }
            
            
        case .accessoryInline:
            Text("The Impossible Dream")
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryCorner:
            switch widgetRenderingMode {
            case .fullColor:
                Image("typo_watch_full")
                    .resizable()
                    .scaledToFit()
                    .widgetLabel {
                        Text("가네 저 별을 향하여")
                            .widgetAccentable(true)
                    }
                    .unredacted()
            default:
                Image("typo_watch")
                    .resizable()
                    .scaledToFit()
                    .widgetLabel {
                        Text("가네 저 별을 향하여")
                            .widgetAccentable(true)
                    }
                    .unredacted()
            }
            
            
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

