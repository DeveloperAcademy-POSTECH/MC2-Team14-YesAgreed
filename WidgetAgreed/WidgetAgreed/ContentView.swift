//
//  ContentView.swift
//  WidgetAgreed
//
//  Created by polyappledev on 2023/05/01.
//

import SwiftUI
import ActivityKit


struct ContentView: View {
    
    var body: some View {
        
        
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Dynamic Island Start"){
                let dynamicIslandWidgetAttributes = MusicalWidgetAttributes(name: "test")
                      let contentState = MusicalWidgetAttributes.ContentState(value: 7)

                      do {
                        let activity = try Activity<MusicalWidgetAttributes>.request(
                          attributes: dynamicIslandWidgetAttributes,
                          contentState: contentState
                        )
                        print(activity)
                      } catch {
                        print(error)
                      }
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
