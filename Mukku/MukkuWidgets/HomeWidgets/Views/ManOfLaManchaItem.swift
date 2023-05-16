import SwiftUI
import WidgetKit

struct ManOfLaManchaItem: View {
    var entry : SimpleEntry = SimpleEntry()
//    var imageID: String?
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                if entry.imageID != [""] && entry.imageID!.last != nil{
//                    if {
                    let imageID = entry.imageID!.last!
                    let image = Helper.getImageFromUserDefaults(key: imageID)
                    if image.size.width > image.size.height{
                        let newImage = image.resized(toWidth: image.size.width*120/image.size.height)
                        
//                        GeometryReader { geo in
//                            Image(uiImage: newImage!)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: geo.size.width)
//                        }
                        Image(uiImage: newImage!)
                            .resizable()
                            .scaledToFill()
//                        Text("width bigger")
                        Text(imageID)
                    } else {
                        let newImage = image.resized(toWidth: 120)
                        
                        Image(uiImage: newImage!)
                            .resizable()
                            .scaledToFill()
//                        GeometryReader { geo in
//                            Image(uiImage: image)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: geo.size.width*0.5)
//                        }
//                        Text("height bigger")
                        Text(imageID)
                    }
                            
                        
//                            .frame(width: 120, height: 120)
                    
//                    }
                    

                } else {
                    Image("lamancha_bg_small")
                        .resizable()
                        .scaledToFit()
                }
                
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
                if entry.imageID != [""] {
                    let imageID = entry.imageID!.last!
                    let image = Helper.getImageFromUserDefaults(key: imageID)
                    let newImage = image.resized(toWidth: 120)
                    
                    Image(uiImage: newImage!)
                        .resizable()
                        .scaledToFit()

                } else {
                    Image("lamancha_bg_medium")
                        .resizable()
                    .scaledToFit()
                    
                }
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


//struct ManOfLaManchaItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
//        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
//        ManOfLaManchaItem(entry:SimpleEntry(scene: "sunflower"), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryInline))
//    }
//}
//
