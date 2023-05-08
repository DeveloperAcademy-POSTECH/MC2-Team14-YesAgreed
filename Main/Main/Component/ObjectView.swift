//
//  ObjectView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct ObjectView: View {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    var text: String
    var imageName: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(14)
                .onTapGesture{
                    feedbackGenerator.impactOccurred()
                }
            Text(text)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
        }
        .frame(width: 75, height: 80)
    }
}

