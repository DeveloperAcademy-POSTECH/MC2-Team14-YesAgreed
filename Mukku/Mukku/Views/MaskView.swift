//
//  MaskView.swift
//  Mukku
//
//  Created by polyappledev on 2023/05/10.
//

import SwiftUI

let maskPositions: [CGPoint] = [
    CGPoint(x: 0.55, y: 0.0054),
    CGPoint(x: 0.35, y: 0.0054),
    CGPoint(x: 0.5, y: 0.0054),
    CGPoint(x: 0.6, y: 0.0054),
    CGPoint(x: 0.4, y: 0.0054),
]

struct MaskView: View {
    @State var animationTime : Int = 0
    @State var maskOpacity : Double = 1
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                HStack{
                    Spacer()
                    ZStack{
                        ForEach(maskPositions.indices, id: \.self) { index in
                            if animationTime == index {
                                Image("mask1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .opacity(maskOpacity)
                                    .position(x: maskPositions[index].x * geometry.size.width, y: maskPositions[index].y * geometry.size.height)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            withAnimation(Animation.easeInOut(duration: 0.1).delay(2).repeatForever(autoreverses: false)) {
                                                maskOpacity = 0
                                            }
                                            withAnimation(nil) {
                                                animationTime = (animationTime + 1) % maskPositions.count
                                            }
                                            maskOpacity = 1
                                        }
                                    }
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
struct MaskView_Previews: PreviewProvider {
    static var previews: some View {
        MaskView()
    }
}


