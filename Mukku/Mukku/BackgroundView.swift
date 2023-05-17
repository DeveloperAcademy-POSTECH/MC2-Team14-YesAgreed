//
//  BackgroundView.swift
//  Mukku
//
//  Created by Diane on 2023/05/16.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var imageManager: ImageManager
    @State private var showImagePicker = false
    @State private var image = UIImage()
    var body: some View {
        VStack{
            
            VStack(alignment: .leading) {
//                Text(" Touch and hold the Home Screen background until the apps begin to jiggle. Then scroll furthest right to empty page.")
                Text("1. Touch and hold the Home Screen background until the apps begin to jiggle. Then scroll furthest right to empty page.").font(.system(size: 18))
                Spacer().frame(height:20)
                Text("2. Press the side button and the volume up button at the same time and quickly release both buttons to take a screenshot of the empty page.").font(.system(size: 18))
                Spacer().frame(height:20)
                Text("3. Tap the “Choose Image” button below and choose the screenshot.").font(.system(size: 18))
                Spacer().frame(height:20)
                Text("4. In the Edit widget, select background to “Transparent” and choose the widget position.").font(.system(size: 18))


            }.padding(.leading, 34).padding(.trailing, 34).padding(.top, 25)
            Spacer().frame(height:UIScreen.main.bounds.size.height*0.05)
//                Text(Image(systemName: "1.circle.fill")).foregroundColor(.blue) + Text(" Touch and hold the Home Screen background until the apps begin to jiggle. Then scroll furthest right to empty page.")
////
//                Text(Image(systemName: "1.circle.fill")).foregroundColor(.blue) + Text(" Touch and hold the Home Screen background until the apps begin to jiggle. Then scroll furthest right to empty page.")
//
//                Text(Image(systemName: "1.circle.fill")).foregroundColor(.blue) + Text(" Touch and hold the Home Screen background until the apps begin to jiggle. Then scroll furthest right to empty page.")
//
//                        Text("This is a longer line of text")
//                    }.background(.red)
//                .padding(.all, 10)
//                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.2, alignment: .top)
//                .background(.blue)
            
            HStack{
                Button {
                    self.showImagePicker.toggle()
                } label: {
                    Text("Choose Image")
                        .foregroundColor(Color.blue)
                        .cornerRadius(15)
                }
                .buttonStyle(.bordered)
                .controlSize(.regular)
                .sheet(isPresented: $showImagePicker, content:{
                    ImagePicker(selectedImage: self.$image)
                })
                .onChange(of:image){
                    _ in imageManager.appendImage(image: image)
                }
                .navigationBarTitle("Transparent Widget Background")
                Spacer().frame(width: 20)
                ZStack(alignment: .bottom){
                        VStack {
                            if (imageManager.photos.count != 0){
                                let photo = imageManager.photos.last!
                                Image(uiImage: Helper.getImageFromUserDefaults(key: photo))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .cornerRadius(10)
                            }
                        }
                }
            }
            Spacer().frame(height:UIScreen.main.bounds.size.height*0.08)
        }
        
        
        
    }
}
