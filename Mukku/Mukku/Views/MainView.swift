//
//  MainView.swift
//  Mukku
//
//  Created by 김혜린 on 2023/05/09.
//

import SwiftUI
import ActivityKit
import PhotosUI

extension UIScreen{
    static let imageBoxSize = UIScreen.main.bounds.size.width / CGFloat(twoColumnsGrid.count) - 10
}

private var twoColumnsGrid = [GridItem(.flexible()), GridItem(.flexible())]

struct MainView: View {
    @State private var isTrackingTime : Bool = false
    @State private var activity : Activity<MukkuWidgetsAttributes>? = nil
    @State private var startTime : Date? = nil
    @State var dynamicEnabled: Bool = true
    @State var dynamicIslandScene: String = ""
    @State var selectedScene: String = ""
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    @EnvironmentObject var imageManager: ImageManager
    @State private var showImagePicker = false
    @State private var image = UIImage()
    @State var backgroundEnabled: Bool = false
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
                                dynamicIslandScene = musical.title + scene.name
                                selectedScene = scene.name.lowercased()
                                // Dynamic island update
                                let updatedState = MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene)
                                let updatedContent = ActivityContent(state: updatedState, staleDate: .now.advanced(by: 1800.0))

                                Task {
                                    await activity?.update(updatedContent)
                                }

                            } label: {
                                ObjectView(isSelected : dynamicIslandScene == musical.title + scene.name, text: scene.name, imageName: scene.icon)}
                            //                                    .onTapGesture{
                            //                                        feedbackGenerator.impactOccurred()
                            //                                    }

                        }
                    }
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
                            let state = MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene)
                            let content =
                            ActivityContent(state: state, staleDate: .now.advanced(by: 3600.0))
                            
                            activity = try? Activity<MukkuWidgetsAttributes>.request(
                                attributes: attributes,
                                content: content )
                        } else {
                            //End the live Activity
                            guard let startTime else{return}
                            let state = MukkuWidgetsAttributes.ContentState(startTime: startTime, scene: selectedScene)
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
            /**
             VStack {
                 if let data = data, let uiimage = UIImage(data:data){
                     Image(uiImage: uiimage).resizable().scaledToFit()
                 }
                 Spacer()
                 PhotosPicker(selection: $selectedItems,
                              maxSelectionCount: 1,
                              matching: .images
                              // matching: .any(of:[.panoramas])로 대체 가능함
                 ) {
                     Text("Pick Background Photo")
                 }
                 .onChange(of: selectedItems) { newValue in
                     guard let item = selectedItems.first else {
                         return
                     }
                     item.loadTransferable(type: Data.self) { result in
                         switch result {
                         case .success(let data):
                             if let data = data {
                                 self.data = data
                                 print(data)
                             } else {
                                 print("Data is nil")
                             }
                         case .failure(let failure):
                             fatalError("\(failure)")
                         }
                     }
                 }
             }
             */
//            Section(header: Text("Use custom Background Image")) {
//                Toggle("Custom Background Image", isOn: $backgroundEnabled)
//                
//            }
            // 저장도 한개만 하도록 변경 필요함
            ZStack(alignment: .bottom){
                    VStack {
                        if (imageManager.photos.count != 0){
                            let photo = imageManager.photos.last!
                            Image(uiImage: Helper.getImageFromUserDefaults(key: photo))
                                .resizable()
                                .scaledToFit()
                        }
                    }

                Button {
                    self.showImagePicker.toggle()
                } label: {
                    Text("Add Photo")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                }
                .sheet(isPresented: $showImagePicker, content:{
                    ImagePicker(selectedImage: self.$image)
                })
                .onChange(of:image){
                    _ in imageManager.appendImage(image: image)
                }

            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ImageManager())
    }
}

