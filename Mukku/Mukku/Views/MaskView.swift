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
                            Image("mask1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .opacity(maskOpacity)
                                .position(x: maskPositions[animationTime].x * geometry.size.width, y: maskPositions[animationTime].y * geometry.size.height)
                                .onAppear {
                                    var animationCycle: () -> Void = {}
                                        animationCycle = {
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(1)) {
                                                maskOpacity = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+1.4) {
                                                animationTime = 1
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(2)) {
                                                maskOpacity = 1
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(3)) {
                                                maskOpacity = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3.4) {
                                                animationTime = 2
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(4)) {
                                                maskOpacity = 1

                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(5)) {
                                                maskOpacity = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+5.4) {
                                                animationTime = 3
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(6)) {
                                                maskOpacity = 1
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(7)) {
                                                maskOpacity = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+7.4) {
                                                animationTime = 4
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(8)) {
                                                maskOpacity = 1
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(9)) {
                                                maskOpacity = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 9.4) {
                                                animationTime = 0
                                                animationCycle()
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(10)) {
                                                maskOpacity = 1
                                            }
                                        }
                                        animationCycle()
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


