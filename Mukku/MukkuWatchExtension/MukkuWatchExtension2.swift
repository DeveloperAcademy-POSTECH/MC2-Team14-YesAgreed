import WidgetKit
import SwiftUI
import Intents

struct LamanchaProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> LamanchaEntry {
        LamanchaEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (LamanchaEntry) -> ()) {
        let entry = LamanchaEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [LamanchaEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = LamanchaEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func recommendations() -> [IntentRecommendation<ConfigurationIntent>] {
        return [
            IntentRecommendation(intent: ConfigurationIntent(), description: "Man of La Mancha")
        ]
    }
}

struct LamanchaEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct LamanchaEntryView : View {
    var entry: LamanchaProvider.Entry
    
    var body: some View {
        LaManchaTypo()
    }
}

struct Lamancha: Widget {
    let kind: String = "LaMancha"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: LamanchaProvider()) { entry in
            LamanchaEntryView(entry: entry)
        }
        .configurationDisplayName("LaMancha Complication")
        .description("Man of La Mancha - Complication")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline, .accessoryCorner])
    }
}

