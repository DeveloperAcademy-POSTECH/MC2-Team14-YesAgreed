//
//  ChandelierView.swift
//  Mukku
//
//  Created by polyappledev on 2023/05/10.
//


import SwiftUI

struct ChandelierView: View {
    @State var animationStart = true
    @State var animationOffset : Int = 0
    @State var chandelierDegrees : Double = 5
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                HStack{
                    Spacer()
                    ZStack{
                            Image("chandelier2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 17)
                                .position(x: 0.49 * geometry.size.width, y: 0.067 * geometry.size.height)
                                .offset(y: CGFloat(animationOffset))
                                .rotationEffect(.degrees(chandelierDegrees), anchor: .top)
                                .onAppear {
                                    var animationCycle: () -> Void = {}
                                        animationCycle = {
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(1)) {
                                                chandelierDegrees = -5
                                            }
                                            withAnimation(Animation.easeInOut(duration: 0.3).delay(2)) {
                                                chandelierDegrees = 0
                                            }
                                            withAnimation(Animation.easeIn(duration: 0.7).delay(3)) {
                                                animationOffset = 1000
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                                chandelierDegrees = 5
                                                animationOffset = 0
                                                animationCycle()
                                            }
                                        }
                                        animationCycle()
                                }
                    }
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}
struct ChandelierView_Previews: PreviewProvider {
    static var previews: some View {
        ChandelierView()
    }
}


