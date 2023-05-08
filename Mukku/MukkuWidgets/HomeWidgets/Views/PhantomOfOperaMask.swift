import SwiftUI
import WidgetKit

struct PhantomOfOperaMask: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var count : Int
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                Image("bg_small")
                    .resizable()
                    .scaledToFit()
                Image("mask\(count)")
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
                Image("boat1")
                    .resizable()
                    .scaledToFit()
                Image("mask\(count)")
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
            Image("mask\(count)")
                .resizable()
                .scaledToFit()
                .widgetAccentable(true)
                .unredacted()
            
        case .accessoryRectangular:
            HStack {
                Image("mask\(count)")
                    .resizable()
                    .scaledToFit()
                Text("Sing For Me!")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.leading, 6)
            .widgetAccentable(true)
            .unredacted()
            
        case .accessoryInline:
            Text("|  Sing For Me!")
                .widgetAccentable(true)
                .unredacted()
            
        default:
            Text("Widget Not Supported)")
        }
        
        
    }
}


struct PhantomOfOperaMask_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaMask(count:1)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        PhantomOfOperaMask(count:1)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        PhantomOfOperaMask(count:1)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        PhantomOfOperaMask(count:1)
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        PhantomOfOperaMask(count:1)
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        
    }
}

