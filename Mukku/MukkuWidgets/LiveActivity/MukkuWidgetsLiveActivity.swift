//
//  MukkuWidgetsLiveActivity.swift
//  MukkuWidgets
//
//  Created by Kihyun Roh on 2023/05/04.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MukkuWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MukkuWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

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
                Image("mask_watch")
                    .resizable()
                    .scaledToFit()
            } compactTrailing: {
                Image("mask_watch")
                    .resizable()
                    .scaledToFit()
            } minimal: {
                Image("mask_watch")
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
    static let contentState = MukkuWidgetsAttributes.ContentState(startTime: Date())

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
