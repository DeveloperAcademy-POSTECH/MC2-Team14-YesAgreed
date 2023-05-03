import ActivityKit
import WidgetKit
import SwiftUI

struct Mc2WidgetsLiveActivity: Widget{
    var body : some WidgetConfiguration{
        ActivityConfiguration(for: Mc2WidgetsAttributes.self){ context in
            // Lock screen/banner UI goes here
            TimeTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct TimeTrackingWidgetView : View {
    let context: ActivityViewContext<Mc2WidgetsAttributes>
    
    var body: some View{
        Text(context.state.startTime, style: .relative)
    }
}

struct widgetWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = Mc2WidgetsAttributes()
    static let contentState = Mc2WidgetsAttributes.ContentState(startTime: Date())

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
