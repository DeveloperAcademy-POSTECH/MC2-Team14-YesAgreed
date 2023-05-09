//
//  ContentView.swift
//  MukkuWatch Watch App
//
//  Created by Jae Ho Yoon on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Open Mukku App\non your iPhone")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
