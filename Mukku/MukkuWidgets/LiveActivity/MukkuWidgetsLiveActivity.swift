import ActivityKit
import WidgetKit
import SwiftUI

struct MukkuWidgetsLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MukkuWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Image("\(context.state.scene)_dynamic")
                        .resizable()
                        .scaledToFit()
                    // more content
                }
            } compactLeading: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
            } compactTrailing: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
            } minimal: {
                Image("\(context.state.scene)_dynamic")
                    .resizable()
                    .scaledToFit()
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
    static let contentState = MukkuWidgetsAttributes.ContentState(startTime: Date(), scene:"mask")

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
