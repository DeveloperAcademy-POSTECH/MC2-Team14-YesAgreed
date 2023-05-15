import SwiftUI
import WidgetKit

struct PhantomOfOperaItem: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry : SimpleEntry = SimpleEntry()
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                Image("phantom_bg_small")
                    .resizable()
                    .scaledToFit()
                Color(entry.bgColor)
                Image("\(entry.scene)\(entry.count)")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFit()
                    .offset(y: -15)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                
                VStack {
                    Spacer()
                    Text("Sing For Me!")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                }
                .padding(.bottom, 20)
            }
            .unredacted()
            
        case .systemMedium:
            ZStack {
                Image("phantom_bg_medium")
                    .resizable()
                    .scaledToFit()
                Image("\(entry.scene)\(entry.count)")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFit()
                    .offset(y: -15)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                
                VStack {
                    Spacer()
                    Text("Sing For Me!")
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


struct PhantomOfOperaItem_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        PhantomOfOperaItem(entry:SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}

