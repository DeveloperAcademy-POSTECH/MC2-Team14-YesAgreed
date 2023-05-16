import SwiftUI
import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date      // 날짜
    let scene: String   //Scene 장면
    let configuration: ConfigurationIntent
    let count: Int      //몇번째 이미지인지 체크해야함
//    let imageID: [String]? = Helper.getImageIdsFromUserDefault() // UserDefault에 저장된 imageID
    let imageID: [String]? // UserDefault에 저장된 imageID
    let position: Dictionary<String, Int>

    init() {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158]
    }
    init(imageID:String?) {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158]
    }
    init(scene:String){
        self.date = Date()
        self.scene = scene
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158]
    }
    init(date: Date, scene : String, configuration: ConfigurationIntent, count: Int, imageID: [String]?, position: Dictionary<String, Int>) {
        self.date = date
        self.scene = scene
        self.configuration = configuration
        self.count = count
        self.imageID = imageID
        self.position = position
    }
}
