//
//  ContentView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct MainView: View {
    @State var dynamicEnabled: Bool = true
    var texts: [String] = ["Mask", "Chandelier", "Boat", "Rose","Sunflower", "Rapier", "Windmill", "Typo"]
    var images: [String] = ["PhantomIcon1", "PhantomIcon2", "PhantomIcon3", "PhantomIcon4", "LamanchaIcon1", "LamanchaIcon2", "LamanchaIcon3", "LamanchaIcon4"]
    var names: [String] = ["Phantom of the Opera", "Man of La Mancha"]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ForEach(0..<2) { ind in
                        Text(names[ind])
                            .bold()
                            .font(.system(size:25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        HStack(alignment: .center, spacing: 15){
                            ForEach(0..<4) { num in
                                ObjectView(text: texts[ind*4 + num], imageName: images[ind*4 + num])
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
