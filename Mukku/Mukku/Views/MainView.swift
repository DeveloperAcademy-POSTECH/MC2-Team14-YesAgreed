//
//  MainView.swift
//  Mukku
//
//  Created by 김혜린 on 2023/05/09.
//

import SwiftUI
import ActivityKit

struct MainView: View {
    @State private var isTrackingTime : Bool = false
    @State private var activity : Activity<MukkuWidgetsAttributes>? = nil
    @State private var startTime : Date? = nil
    @State var dynamicEnabled: Bool = true
    @State var isSelectedd: String = ""
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    
    var body: some View {
        
        Form {
            
            Section (header:
                        VStack{
                ForEach(MusicalModel.musicalModels, id:\.self){ musical in
                    Text(musical.title)
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                        .textCase(nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //                                .padding(.leading, 20)
                        .padding(.top, 20)
                    HStack(alignment: .center, spacing: 15){
                        ForEach(musical.scene, id:\.self) { scene in
                            Button{
                                isSelectedd = musical.title + scene.name
                                print(isSelectedd)
                            } label: {
                                ObjectView(isSelected : isSelectedd == musical.title + scene.name, text: scene.name, imageName: scene.icon)}
                            //                                    .onTapGesture{
                            //                                        feedbackGenerator.impactOccurred()
                            //                                    }
                        }
                    }
                    //                                .padding(.bottom, 20)
                }
            }){
            }
            
            
            Section(header: Text("Dynamic Island Setting")) {
                Toggle(
                    "Dynamic Island",
                    isOn: $isTrackingTime).onChange(of:isTrackingTime) { _ in
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
                            Task{await activity?.end(content, dismissalPolicy: .immediate)}
                            self.startTime = nil
                        }
                    }
            }
            Section() {
                ZStack{
                    HStack{
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("      Widget Instruction")
                            .foregroundColor(.blue)
                        Spacer()
                    }
                }
                Text("You can add the Home screen widget and the Lock screen widget directly with a long press gesture on the screen. You can select objects and backgrounds in the Edit Widgets window.")
                    .font(.system(size: 15))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

