import Foundation
import ActivityKit

struct MukkuWidgetsAttributes : ActivityAttributes {
    typealias TimeTrackingStatus = ContentState
    
    struct ContentState: Codable, Hashable{
        var startTime: Date
        var scene: String
    }
}
