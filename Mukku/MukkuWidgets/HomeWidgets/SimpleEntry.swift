import SwiftUI
import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date      // 날짜
    let scene: String   //Scene 장면
    let configuration: ConfigurationIntent
    let count: Int      //몇번째 이미지인지 체크해야함
//    let imageID: [String]? = Helper.getImageIdsFromUserDefault() // UserDefault에 저장된 imageID
    let imageID: [String]? // UserDefault에 저장된 imageID

    init() {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
    }
    init(imageID:String?) {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
    }
    init(scene:String){
        self.date = Date()
        self.scene = scene
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
    }
    init(date: Date, scene : String, configuration: ConfigurationIntent, count: Int, imageID: [String]?) {
        self.date = date
        self.scene = scene
        self.configuration = configuration
        self.count = count
//        self.imageID = Helper.getImageIdsFromUserDefault()
        self.imageID = imageID
    }
}
