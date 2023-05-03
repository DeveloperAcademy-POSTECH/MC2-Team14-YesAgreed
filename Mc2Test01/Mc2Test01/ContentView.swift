import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingTime : Bool = false
    @State private var activity : Activity<Mc2WidgetsAttributes>? = nil
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
                        let attributes = Mc2WidgetsAttributes()
                        let state = Mc2WidgetsAttributes.ContentState(startTime: .now)
                        
                        activity = try? Activity<Mc2WidgetsAttributes>.request(
                            attributes: attributes,
                            contentState: state)
                    } else {
                        //End the live Activity
                        guard let startTime else{return}
                        let state = Mc2WidgetsAttributes.ContentState(startTime: startTime)
    
                        Task{
                            await activity?.end(using: state, dismissalPolicy: .immediate)
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
