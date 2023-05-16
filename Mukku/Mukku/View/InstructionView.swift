//
//  InstructionTabView.swift
//  Mukku
//
//  Created by Jae Ho Yoon on 2023/05/17.
//

import SwiftUI

struct InstructionView: View {
    @State private var selected = 0
    var target: [Instruction]

    var body: some View {
        TabView() {
            ForEach(target, id:\.self) {
                instruction in
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        Spacer()
                            .frame(height: geometry.size.width * 0.05)
                        HStack {
                            Spacer()
                            Image(instruction.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.63)
                                .padding()
                            Spacer()
                        }
                        
                        VStack(alignment: .leading) {
                            Text(instruction.title)
                                .font(.system(size: 22, weight: .black))
                            
                            Text(instruction.description)
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
                .navigationBarTitle(LocalizedStringKey(instruction.target))
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(target: widgetInstructions)
    }
}
