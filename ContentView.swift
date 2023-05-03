import ActivityKit
import SwiftUI

struct ContentView: View {
    @State private var isDynamicOn: Bool = false
    @State private var startTime: Date? = nil
    @State private var activity: Activity<Mc2WidgetsAttributes>? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(String(describing: startTime))
            Button(){
                isDynamicOn.toggle()
                if isDynamicOn{
                    startTime = .now
                } else {
                    startTime = nil
                }
                print(isDynamicOn)
            } label: {
                Text(isDynamicOn ? "Dynamic Island Stop" : "Dynamic Island Start")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
