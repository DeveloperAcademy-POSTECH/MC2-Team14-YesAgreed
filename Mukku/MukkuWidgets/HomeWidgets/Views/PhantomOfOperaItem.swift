import SwiftUI
import WidgetKit

extension UIImage {
  func resized(toWidth width: CGFloat, isOpaque: Bool = true) -> UIImage? {
    let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
    let format = imageRendererFormat
    format.opaque = isOpaque
    return UIGraphicsImageRenderer(size: canvas, format: format).image {
      _ in draw(in: CGRect(origin: .zero, size: canvas))
    }
  }
}
struct PhantomOfOperaItem: View {
    var entry : SimpleEntry = SimpleEntry()
//    var imageID: String?
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                // Transparent background
                if entry.imageID != [""] && entry.imageID!.last != nil{
                        let imageID = entry.imageID?.last!
                        let image = Helper.getImageFromUserDefaults(key: imageID!)
                        let newImage = image.resized(toWidth: 393)! // sketch는 390 실제는 393
                        let sideLength = 158
//                        let imageSize = newImage.size
                        // left top
                        let xOffset = 28// 273*2
                        let yOffset = 90// 26*2
                    let cropRect = CGRect(x:xOffset, y:yOffset, width: sideLength, height: sideLength).integral
                    let sourceCGIamge = newImage.cgImage!
                    let croppedCGImage = sourceCGIamge.cropping(to: cropRect)!
                    
                    let croppedImage = UIImage(cgImage: croppedCGImage, scale: newImage.imageRendererFormat.scale, orientation: newImage.imageOrientation)
                    
//                        let newImage = image.resized(toWidth: 120)
                        Image(uiImage: croppedImage)
//                        Image(uiImage: newImage!)
//                            .resizable()
//                            .scaledToFit()
                    
//                    GeometryReader { geo in
//                        Image(uiImage: newImage!).resizable().scaledToFit()
//                        HStack{
//                            Text(geo.size.width)
//                            Text(geo.size.height)
//                        }
//
//                    }
//                    }
                    

                } else {
                    Image("phantom_bg_small")
                        .resizable()
                        .scaledToFit()
                }

                Image("\(entry.scene)\(entry.count)")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFit()
                    .offset(y: -15)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                
                VStack {
                    Spacer()
                    Text("Check this out")
                    Text("Sing For Me!")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                }
                .padding(.bottom, 20)
            }
            .unredacted()
            
        case .systemMedium:
            ZStack {
//                if entry.imageID != "" {
//                    let imageID = entry.imageID
//                    let image = Helper.getImageFromUserDefaults(key: imageID)
//                    let newImage = image.resized(toWidth: 120)
//                    
//                    Image(uiImage: newImage!)
//                        .resizable()
//                        .scaledToFit()
//
//                }
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
//                    Text(String(isTransparent))
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


//struct PhantomOfOperaItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PhantomOfOperaItem(entry:SimpleEntry(), transparentBackground: nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//        PhantomOfOperaItem(entry:SimpleEntry(), transparentBackground:nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//        PhantomOfOperaItem(entry:SimpleEntry(), transparentBackground:nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
//        PhantomOfOperaItem(entry:SimpleEntry(), transparentBackground:nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
//        PhantomOfOperaItem(entry:SimpleEntry(), transparentBackground:nil, isTransparent: false)
//            .previewContext(WidgetPreviewContext(family: .accessoryInline))
//    }
//}

