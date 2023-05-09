//
//  ObjectView.swift
//  Main
//
//  Created by 김혜린 on 2023/05/08.
//

import SwiftUI

struct ObjectView: View {
    @State private var isTapped = false
    var isSelected : Bool = false
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
                        .stroke(isSelected ? Color.green: Color.clear, lineWidth: 3)
                )
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(width: 75, height: 80)
    }
}
