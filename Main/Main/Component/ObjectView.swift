//
//  ObjectView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct ObjectView: View {
    @State private var isTapped = false
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    var text: String
    var imageName: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(isTapped ? Color.green: Color.clear, lineWidth: 3)
                )
                .onTapGesture{
                    feedbackGenerator.impactOccurred()
                    self.isTapped.toggle()
                }
            Text(text)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
        }
        .frame(width: 75, height: 80)
    }
}

