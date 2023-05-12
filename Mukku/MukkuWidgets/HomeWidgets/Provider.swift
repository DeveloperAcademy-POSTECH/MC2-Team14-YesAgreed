import SwiftUI
import WidgetKit
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        //return SimpleEntry()
        SimpleEntry(imageID:nil)
    }

    // Config 설정가능한 곳
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), scene: "mask", configuration: configuration, count: 1, imageID: "")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        
        // 이미지 갯수 세기
        let topic =  matching(by: configuration.mc2Enum)
        let imgNum = countImgNum(name : topic)
        
        // bg
        let bg = backgrounding(by: configuration.backgroundEnum)
//        let bg = matching(by: configuration.transparentEnum)
//        if bg
//        print(bg)
//        switch bg{
//        case.upperright
//        }
        
        // transparentbackground 정보
//        let imageIds = Helper.getImageIdsFromUserDefault()
//        print("ho")
//        print("this is imageIds", imageIds)
//        if !imageIds.isEmpty{
//            print("this is imageIds last", imageIds.last!)
//        }
        
        //120 개에 가까운 img 생성
        for imgCount in 0 ..< (120/imgNum)*imgNum {
            let entryDate = Calendar.current.date(byAdding: .second, value: imgCount, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, scene: topic, configuration: ConfigurationIntent(), count: (imgCount%imgNum+1), imageID: bg)
            entries.append(entry)
        }
        //print("Done in \(Date())")
        //print(entries.count) //이건 매번 갱신됨, 항상 120개가 되는 것을 알 수 있다.

        let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 120)))
        completion(timeline)
    }
    fileprivate func countImgNum(name imgName : String)->Int{
        for i in 1..<10 {
            if let _ = UIImage(named:"\(imgName)\(i)") {continue} else {
                return i-1}}
        return 0
    }
    fileprivate func matching(by mC2WidgetEnum: Mc2Enum)->String{
        switch mC2WidgetEnum {
        case.phantomOfOpera1: return "mask"
        case.phantomOfOpera2: return "boat"
        case.phantomOfOpera3: return "chandelier"
        case.phantomOfOpera4: return "rose"
        case.manOfLaMancha1: return "sunflower"
        case.manOfLaMancha2: return "rapier"
        case.manOfLaMancha3: return "windmill"
        case.manOfLaMancha4: return "typo"
        case.unknown: return "mask"
        }
    }
    fileprivate func backgrounding(by mC2BackgroundEnum: BackgroundEnum)->String{
        let imageIds = Helper.getImageIdsFromUserDefault()
        switch mC2BackgroundEnum {
        case.transparent: return imageIds.last!
        case.topicDefault: return ""
        case.unknown: return ""
        }

    }
//    fileprivate func matching(by mCTransparentnum: BackgroundEnum)->String{
//        switch mCTransparentnum {
//        case.phantomOfOpera1: return "mask"
//        case.phantomOfOpera2: return "boat"
//        case.phantomOfOpera3: return "chandelier"
//        case.phantomOfOpera4: return "rose"
//        case.manOfLaMancha1: return "sunflower"
//        case.manOfLaMancha2: return "rapier"
//        case.manOfLaMancha3: return "windmill"
//        case.manOfLaMancha4: return "typo"
//        case.unknown: return "nil"
//        }
//    }
    
}
