import WidgetKit
import SwiftUI
import Intents

struct MukkuWidgets: Widget {
    let kind: String = "MukkuWidgets"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: ConfigurationIntent.self,
            provider: Provider()) { entry in
                MukkuWidgetsEntryView(entry: entry)
            }
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
            .supportedFamilies([.systemSmall, .systemMedium, .accessoryInline, .accessoryCircular, .accessoryRectangular])
    }
}

struct MukkuWidgets_Previews: PreviewProvider {
    static var previews: some View {
        MukkuWidgetsEntryView(entry: SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
