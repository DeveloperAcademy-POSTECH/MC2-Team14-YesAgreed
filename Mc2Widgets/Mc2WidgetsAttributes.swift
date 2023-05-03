import ActivityKit
import WidgetKit
import SwiftUI

struct Mc2WidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
        var startTime : Date
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
