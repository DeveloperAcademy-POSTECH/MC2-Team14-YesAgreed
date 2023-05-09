//
//  ContentView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct MainView: View {
    @State var dynamicEnabled: Bool = true
    @State var isSelectedd: String = ""
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView{
            ZStack{
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ForEach(MusicalModel.musicalModels, id:\.self){ musical in
                        Text(musical.title)
                            .bold()
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        HStack(alignment: .center, spacing: 15){
                            ForEach(musical.scene, id:\.self) { scene in
                                Button{
                                    isSelectedd = musical.title + scene.name
                                    print(isSelectedd)
                                } label: {
                                    ObjectView(isSelected : isSelectedd == musical.title + scene.name, text: scene.name, imageName: scene.icon)}
                                .onTapGesture{
                                    feedbackGenerator.impactOccurred()
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        Divider()
                            .frame(width: 370, height: 0.7)
                            .background(.gray)
                    }
                    .navigationBarTitle("MuKku", displayMode: .inline)
                    Form{
                        Section(header: Text("Dynamic Island Setting")) {
                            Toggle(isOn: $dynamicEnabled) {
                                Text("Dynamic Island")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
