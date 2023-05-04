import WidgetKit
import SwiftUI
import Intents

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
    init() {
        self.date = Date()
        self.configuration = ConfigurationIntent()
    }
    
    init(date: Date, configuration: ConfigurationIntent){
        self.date = date
        self.configuration = configuration
    }
}
