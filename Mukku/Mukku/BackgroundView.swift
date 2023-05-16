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
        
        ZStack(alignment: .bottom){
                VStack {
                    if (imageManager.photos.count != 0){
                        let photo = imageManager.photos.last!
                        Image(uiImage: Helper.getImageFromUserDefaults(key: photo))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                    }
                }
        }
        Button {
            self.showImagePicker.toggle()
        } label: {
            Text("Upload Image")
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
    }
}
