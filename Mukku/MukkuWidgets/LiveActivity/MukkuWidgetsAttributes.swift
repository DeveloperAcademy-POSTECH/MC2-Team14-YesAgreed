import Foundation
import ActivityKit

struct MukkuWidgetsAttributes : ActivityAttributes {
    typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable{
        var startTime: Date
        var scene: String
    }
}
