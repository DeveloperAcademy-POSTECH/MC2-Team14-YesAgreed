import SwiftUI
import WidgetKit

struct ManOfLaManchaItem: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry : SimpleEntry = SimpleEntry()
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                Image("lamancha_bg_small")
                    .resizable()
                    .scaledToFit()
                Color(entry.bgColor)
                VStack{
                    Spacer().frame(height: 20)
                    Image("\(entry.scene)\(entry.count)")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                        .offset(y: -15)
                }
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
            }
            .unredacted()
            
        case .systemMedium:
            ZStack {
                Image("lamancha_bg_medium")
                    .resizable()
                    .scaledToFit()
                Color(entry.bgColor)
                VStack{
                    Image("\(entry.scene)\(entry.count)")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                        .offset(y: -15)
                }
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                
                VStack {
                    Spacer()
                    Text("The Impossible Dream")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                }
                .padding(.bottom, 20)
            }
            .unredacted()
            
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


struct ManOfLaManchaItem_Previews: PreviewProvider {
    static var previews: some View {
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}

