import SwiftUI
import WidgetKit


struct ManOfLaManchaItem: View {
    
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
                    Image("lamancha_bg_small")
                        .resizable()
                        .scaledToFit()
                    Color(entry.bgColor)
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
                    Image("lamancha_bg_medium")
                    .resizable()
                    .scaledToFit()
                    Color(entry.bgColor)
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
    }
}
