//
//  RoseView.swift
//  Mukku
//
//  Created by polyappledev on 2023/05/11.
//

import SwiftUI


struct RoseView: View {
    @State var animationTime : Int = 0
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                HStack{
                    Spacer()
                    ZStack{
                        Image("rose\(animationTime+1)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13, height: 13)
                            .position(x: 0.49 * geometry.size.width, y: 0.006 * geometry.size.height)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 1.0).repeatForever()) {
                                    animationTime += 1
                                }
                            }
                    }
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}
struct RoseView_Previews: PreviewProvider {
    static var previews: some View {
        RoseView()
    }
}


