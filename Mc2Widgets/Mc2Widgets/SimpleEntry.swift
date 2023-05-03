import SwiftUI
import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date      // 날짜
    let scene: String   //Scene 장면
    let configuration: ConfigurationIntent
    let count: Int      //몇번째 이미지인지 체크해야함
    
    init() {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationIntent()
        self.count = 1
    }
    init(scene:String){
        self.date = Date()
        self.scene = scene
        self.configuration = ConfigurationIntent()
        self.count = 1
    }
    init(date: Date, scene : String, configuration: ConfigurationIntent, count: Int) {
        self.date = date
        self.scene = scene
        self.configuration = configuration
        self.count = count
    }
}
