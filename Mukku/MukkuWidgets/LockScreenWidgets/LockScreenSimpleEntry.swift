import SwiftUI
import WidgetKit

struct LockScreenSimpleEntry: TimelineEntry {
    let date: Date      // 날짜
    let scene: String   //Scene 장면
    let configuration: ConfigurationLockScreenIntent
    let count: Int      //몇번째 이미지인지 체크해야함
    
    init() {
        self.date = Date()
        self.scene = "mask"
        self.configuration = ConfigurationLockScreenIntent()
        self.count = 1
    }
    init(scene:String){
        self.date = Date()
        self.scene = scene
        self.configuration = ConfigurationLockScreenIntent()
        self.count = 1
    }
    init(date: Date, scene : String, configuration: ConfigurationLockScreenIntent, count: Int) {
        self.date = date
        self.scene = scene
        self.configuration = configuration
        self.count = count
    }
}
