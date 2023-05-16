//
//  InstructionView.swift
//  Mukku
//
//  Created by Diane on 2023/05/16.
//

import Foundation
import SwiftUI

struct WidgetInstructionView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Image("widgetInstruction1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: geometry.size.height * 0.63)
                        .padding()
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("잠금 화면 개인 맞춤화하기")
                        .font(.system(size: 22, weight: .black))
                    
                    Text("즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 \(Image(systemName: "plus.circle.fill"))을 탭하여 새로운 잠금 화면을 생성하세요.")
                        .font(.system(size: 15))
                        .lineSpacing(4)
                        .multilineTextAlignment(.leading)
                        .padding(.top, -5)
                }
                .frame(width: geometry.size.width * 0.84)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationBarTitle("Instruction")
    }
}


struct WidgetInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetInstructionView()
    }
}
