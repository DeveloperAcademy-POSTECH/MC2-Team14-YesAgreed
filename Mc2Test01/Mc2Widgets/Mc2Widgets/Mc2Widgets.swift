import WidgetKit
import SwiftUI
import Intents

struct Mc2Widgets: Widget {
    let kind: String = "Mc2Widgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: ConfigurationIntent.self,
            provider: Provider()) { entry in
                Mc2WidgetsEntryView(entry: entry)   //위젯 엔트리 설정하는 곳
        }
        .configurationDisplayName("My Widget")      //위젯 꺼낼 때 표시되는 곳
        .description("This is an example widget.")  //위젯 꺼낼 때 설명되는 곳
    }
}

struct Mc2Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Mc2WidgetsEntryView(entry: SimpleEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
