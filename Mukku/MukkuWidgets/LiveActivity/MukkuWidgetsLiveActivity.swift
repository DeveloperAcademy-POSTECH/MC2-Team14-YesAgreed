import ActivityKit
import WidgetKit
import SwiftUI

struct MukkuWidgetsLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MukkuWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                        .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                        .clipShape(Circle())
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                        .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                        .clipShape(Circle())
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                        .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                        .clipShape(Circle())
                    // more content
                }
            } compactLeading: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
                    .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                    .clipShape(Circle())
            } compactTrailing: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
                    .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                    .clipShape(Circle())
            } minimal: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
                    .background(context.state.scene == "typo" ? Color.yellow : Color.clear)
                    .clipShape(Circle())
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct TimeTrackingWidgetView : View {
    let context: ActivityViewContext<MukkuWidgetsAttributes>
    
    var body: some View{
        Text(context.state.startTime, style: .relative)
    }
}

struct MukkuWidgetsLiveActivity_Previews: PreviewProvider {
    static let attributes = MukkuWidgetsAttributes()
    static let contentState = MukkuWidgetsAttributes.ContentState(startTime: Date(), scene:"typo")

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
