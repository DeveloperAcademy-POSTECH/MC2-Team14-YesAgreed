import SwiftUI
import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date      // 날짜
    let scene: String   //Scene 장면
    let configuration: ConfigurationIntent
    let count: Int      //몇번째 이미지인지 체크해야함
    let imageID: [String]? // UserDefault에 저장된 imageID
    let position: Dictionary<String, Int> // Widget position
    let bgColor: UIColor
    
    init() {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        if UIDevice.current.name == "iPhone 14 Pro Max" {
            self.position = ["xOffset":33, "yOffset":94, "widthLength":170, "heightLength":170, "resizeWidth":430]
        } else {
            self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158, "resizeWidth":393]
        }
        self.bgColor = UIColor(Color.clear)
    }
    init(imageID:[String]?) {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        if UIDevice.current.name == "iPhone 14 Pro Max" {
            self.position = ["xOffset":33, "yOffset":94, "widthLength":170, "heightLength":170, "resizeWidth":430]
        } else {
            self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158, "resizeWidth":393]
        }
        self.bgColor = UIColor(Color.clear)
    }
    init(scene:String){
        self.date = Date()
        self.scene = scene
        self.configuration = ConfigurationIntent()
        self.count = 1
        self.imageID = [""]
        if UIDevice.current.name == "iPhone 14 Pro Max" {
            self.position = ["xOffset":33, "yOffset":94, "widthLength":170, "heightLength":170, "resizeWidth":430]
        } else {
            self.position = ["xOffset":28, "yOffset":90, "widthLength":158, "heightLength":158, "resizeWidth":393]
        }
        self.bgColor = UIColor(Color.clear)
    }
    init(date: Date, scene : String, configuration: ConfigurationIntent, count: Int, imageID: [String]?, position: Dictionary<String, Int>, bgColor: UIColor) {
        self.date = date
        self.scene = scene
        self.configuration = configuration
        self.count = count
        self.imageID = imageID
        self.position = position
        self.bgColor = bgColor
    }
}
