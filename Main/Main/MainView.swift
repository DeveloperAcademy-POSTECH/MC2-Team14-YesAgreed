//
//  ContentView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct ObjectView: View {
    var text: String
    var imageName: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(14)
            Text(text)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
        }
    }
}

struct MainView: View {
    var texts: [String] = ["Mask", "Chandelier", "Boat", "Rose"]
    var images: [String] = ["PhantomIcon1", "PhantomIcon2", "PhantomIcon3", "PhantomIcon4"]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Phantom of the Opera")
                    .bold()
                    .font(.system(size:25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                HStack(alignment: .center, spacing: 25){
                    ForEach(0..<4) { num in
                        ObjectView(text: texts[num], imageName: images[num])
                    }
                }
                .padding()
                Divider()
                    .frame(width: 370, height: 0.7)
                    .background(.gray)
            }
            .navigationBarTitle("CCC", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
