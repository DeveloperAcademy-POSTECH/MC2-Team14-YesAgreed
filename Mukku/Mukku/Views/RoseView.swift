//
//  RoseView.swift
//  Mukku
//
//  Created by polyappledev on 2023/05/11.
//

import SwiftUI

let rosePositions: [CGPoint] = [
    CGPoint(x: 0.44, y: 0.005),
    CGPoint(x: 0.48, y: 0.005),
    CGPoint(x: 0.52, y: 0.005),
]

struct RoseView: View {
    @State var animationTime : Int = 0
    @State var petalOpacity1 : Double = 0
    @State var petalOpacity2 : Double = 0
    @State private var yOffset: CGFloat = .zero
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                HStack{
                    Spacer()
                    ZStack{

                        Image("petal1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 4)
                            .opacity(petalOpacity1)
                            .position(x: 0.425 * geometry.size.width, y: 0.006 * geometry.size.height)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).delay(2).repeatForever(autoreverses: true)) {
                                    petalOpacity1 = 1
                                }
                            }
                        Image("petal2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 6, height: 6)
                            .opacity(petalOpacity2)
                            .position(x: 0.445 * geometry.size.width, y: 0.006 * geometry.size.height)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: true)) {
                                    petalOpacity2 = 2
                                }
                            }
                        Image("rose1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .position(x: 0.48 * geometry.size.width, y: 0.005 * geometry.size.height)
                            .offset(x: 0, y: yOffset)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                    yOffset = 0.0007 * geometry.size.height
                                }
                            }
                        Image("petal3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 6, height: 6)
                            .opacity(petalOpacity2)
                            .position(x: 0.51 * geometry.size.width, y: 0.006 * geometry.size.height)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: true)) {
                                    petalOpacity2 = 1
                                }
                            }
                        Image("petal1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 4)
                            .opacity(petalOpacity1)
                            .position(x: 0.54 * geometry.size.width, y: 0.006 * geometry.size.height)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).delay(2).repeatForever(autoreverses: true)) {
                                    petalOpacity1 = 2
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


