import WidgetKit
import SwiftUI
import Intents

struct Mc2Widgets: Widget {
    let kind: String = "Mc2Widgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Mc2WidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Mc2Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Mc2WidgetsEntryView(entry: SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
