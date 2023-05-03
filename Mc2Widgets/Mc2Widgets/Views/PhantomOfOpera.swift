//
//  PhantomOfOpera.swift
//  Mc2WidgetsExtension
//
//  Created by Kihyun Roh on 2023/05/03.
//

import SwiftUI

struct PhantomOfOperaMask: View {
    var count : Int
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(red: 0.15, green: 0.28, blue: 0.48), Color.black]), center: .top, startRadius: 20, endRadius: 200)
            Image("bg_small")
                .resizable()
                .scaledToFit()
            Image("mask\(count)")
                .resizable()
                .frame(width: 120, height: 120)
                .scaledToFit()
                .offset(y: -15)
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
            VStack {
                Spacer()
                Text("Arghhhhhh")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
            }
            .padding(.bottom, 20)
        }
    }
}

struct PhantomOfOperaMAsk_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaMask(count:1)
    }
}
