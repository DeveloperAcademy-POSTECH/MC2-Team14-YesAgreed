import Foundation
import ActivityKit

struct Mc2WidgetsAttributes : ActivityAttributes {
    typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable{
        var startTime: Date
    }
}
