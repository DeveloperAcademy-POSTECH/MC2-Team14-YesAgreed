//
//  MusicalWidget.swift
//  MusicalWidget
//
//  Created by polyappledev on 2023/05/01.
//

import WidgetKit
import SwiftUI
import Intents




struct Provider: IntentTimelineProvider {
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), image: Image(images[currentEvent]), configuration: ConfigurationIntent())
    }
    
    // 위젯 선택 화면
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), image: Image(images[currentEvent]), configuration: configuration)
        completion(entry)
    }
    
    // 위젯 갱신 시간대 설정
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        print("START")
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        
        
        for i in 0 ..< images.count {
            let entryDate = Calendar.current.date(byAdding: .second, value: i, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, image: Image(images[i]), configuration: configuration)
            entries.append(entry)
        }
        currentEvent = 0
        let reloadDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        let timeline = Timeline(entries: entries, policy: .after(reloadDate))
        completion(timeline)
    }
}





struct SimpleEntry: TimelineEntry {
    let date: Date
    let image: Image // Image entry 추가
    let configuration: ConfigurationIntent
}


let images = ["mask1","mask2","mask3","mask4","mask5","mask6","mask7","mask8","mask1","mask2","mask3","mask4","mask5","mask6","mask7","mask8","mask1","mask2","mask3","mask4","mask5","mask6","mask7","mask8"]
var currentEvent = 0


struct MusicalWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(red: 0.15, green: 0.28, blue: 0.48), Color.black]), center: .top, startRadius: 20, endRadius: 200)
            Image("bg_small")
                .resizable()
                .scaledToFit()
            entry.image
                .resizable()
                .frame(width: 120, height: 120)
                .scaledToFit()
                .offset(y: -15)
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
            VStack {
                Spacer()
                Text("Arghhhhhh")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                //                    .opacity(0.7)
                Text(entry.date, style: .time)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
            }
            .padding(.bottom, 20)
        }
    }
}



struct MusicalWidget: Widget {
    let kind: String = "MusicalWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MusicalWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Musical Widget")
        .description("Yeaaaaaaaah")
        .supportedFamilies([.systemSmall,.systemMedium])
        
    }
}

struct MusicalWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        MusicalWidgetEntryView(entry: SimpleEntry(date: Date(), image: Image(images[currentEvent]), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
struct MusicalWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        MusicalWidgetEntryView(entry: SimpleEntry(date: Date(), image: Image(images[currentEvent]), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
