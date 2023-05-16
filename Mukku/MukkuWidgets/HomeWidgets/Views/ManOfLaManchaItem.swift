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
                    let imageID = entry.imageID?.last!
                    let image = Helper.getImageFromUserDefaults(key: imageID!)
                    let newImage = image.resized(toWidth: 393)! // sketch는 390 실제는 393
                    // small size
                    let sideLength = 158
                    // 우측 상단
                    let xOffset = 158+28+22// 273*2
                    let yOffset = 90// 26*2
                    let cropRect = CGRect(x:xOffset, y:yOffset, width: sideLength, height: sideLength).integral
                    let sourceCGIamge = newImage.cgImage!
                    let croppedCGImage = sourceCGIamge.cropping(to: cropRect)!
                    
                    let croppedImage = UIImage(cgImage: croppedCGImage, scale: newImage.imageRendererFormat.scale, orientation: newImage.imageOrientation)
                    
                    Image(uiImage: croppedImage)
                    

                    
                            
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
