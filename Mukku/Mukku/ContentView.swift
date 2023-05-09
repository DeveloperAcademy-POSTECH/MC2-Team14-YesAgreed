import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingTime : Bool = false
    @State private var activity : Activity<MukkuWidgetsAttributes>? = nil
    @State private var startTime : Date? = nil
    var body: some View {
        NavigationView{
            VStack{
                if let startTime {
                    Text(startTime, style: .relative)
                }
                Button {
                    isTrackingTime.toggle()
                    
                    if isTrackingTime {
                        startTime = .now
                        
                        //Start the live Activity
                        let attributes = MukkuWidgetsAttributes()
                        let state = MukkuWidgetsAttributes.ContentState(startTime: .now)
                        let content =
                        ActivityContent(state: state, staleDate: .now.advanced(by: 3600.0))
                        
                        activity = try? Activity<MukkuWidgetsAttributes>.request(
                            attributes: attributes,
                            content: content )
                    } else {
                        //End the live Activity
                        guard let startTime else{return}
                        let state = MukkuWidgetsAttributes.ContentState(startTime: startTime)
                        let content = ActivityContent(state: state, staleDate: .now.advanced(by: 3600.0))
                        Task{
                            await activity?.end(content, dismissalPolicy: .immediate)
                        }
            
                        self.startTime = nil
                        
                    }
                    
                } label : {
                    Text(isTrackingTime ? "Stop" : "Start")
                    
                }
                .navigationTitle("Basic Time Tracker")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
