import SwiftUI
import WidgetKit
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        //return SimpleEntry()
        SimpleEntry()
    }

    // Config 설정가능한 곳
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), scene: "mask", configuration: configuration, count: 1, bgColor: UIColor(Color.clear))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        
        // 이미지 갯수 세기
        let topic =  matching(by: configuration.mc2Enum)
        let imgNum = countImgNum(name : topic)
        
        let bgColor = coloring(by: configuration.colorEnum)
        
        //120 개에 가까운 img 생성
        for imgCount in 0 ..< (120/imgNum)*imgNum {
            let entryDate = Calendar.current.date(byAdding: .second, value: imgCount, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, scene: topic, configuration: ConfigurationIntent(), count: (imgCount%imgNum+1), bgColor: bgColor)
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
    fileprivate func coloring(by colorWidgetEnum: ColorEnum)->UIColor{
        switch colorWidgetEnum {
        case.red: return UIColor(Color.red)
        case.orange: return UIColor(Color.orange)
        case.yellow: return UIColor(Color.yellow)
        case .green: return UIColor(Color.green)
        case .blue: return UIColor(Color.blue)
        case .purple: return UIColor(Color.purple)
        case .gray: return UIColor(Color.gray)
        case .black: return UIColor(Color.black)
        case .defaultTheme: return UIColor(Color.clear)
        case.unknown: return UIColor(Color.clear)
        }
    }
}
