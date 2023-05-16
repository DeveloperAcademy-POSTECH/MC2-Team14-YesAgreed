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
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry : SimpleEntry = SimpleEntry()
    var body: some View {
        
        switch widgetFamily {
        case .systemSmall:
            ZStack {
                if entry.imageID != [""] && entry.imageID!.last != nil{
                    let imageID = entry.imageID?.last!
                    let image = Helper.getImageFromUserDefaults(key: imageID!)
                    let newImage = image.resized(toWidth: 393)! // sketch는 390 실제는 393
                    
                    let xOffset = entry.position["xOffset"]!// 273*2
                    let yOffset = entry.position["yOffset"]!// 26*2
                    let widthLength = entry.position["widthLength"]!
                    let heightLength = entry.position["heightLength"]!
                    let cropRect = CGRect(x:xOffset, y:yOffset, width: widthLength, height: heightLength).integral
                    let sourceCGIamge = newImage.cgImage!
                    let croppedCGImage = sourceCGIamge.cropping(to: cropRect)!
                    
                    let croppedImage = UIImage(cgImage: croppedCGImage, scale: newImage.imageRendererFormat.scale, orientation: newImage.imageOrientation)
                    
                    Image(uiImage: croppedImage)
                    

                } else {
                    Image("phantom_bg_small")
                        .resizable()
                        .scaledToFit()
                    Color(entry.bgColor)
                }
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
                if entry.imageID != [""] && entry.imageID!.last != nil{
                    let imageID = entry.imageID?.last!
                    let image = Helper.getImageFromUserDefaults(key: imageID!)
                    let newImage = image.resized(toWidth: 393)! // sketch는 390 실제는 393
                    
                    let xOffset = entry.position["xOffset"]!// 273*2
                    let yOffset = entry.position["yOffset"]!// 26*2
                    let widthLength = entry.position["widthLength"]!
                    let heightLength = entry.position["heightLength"]!
                    let cropRect = CGRect(x:xOffset, y:yOffset, width: widthLength, height: heightLength).integral
                    let sourceCGIamge = newImage.cgImage!
                    let croppedCGImage = sourceCGIamge.cropping(to: cropRect)!
                    
                    let croppedImage = UIImage(cgImage: croppedCGImage, scale: newImage.imageRendererFormat.scale, orientation: newImage.imageOrientation)
                    
                    Image(uiImage: croppedImage)
                } else {
                    Image("phantom_bg_medium")
                        .resizable()
                        .scaledToFit()
                    Color(entry.bgColor)
                }
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
    }
}
