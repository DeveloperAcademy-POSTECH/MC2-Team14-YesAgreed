//
//  RapierView.swift
//  Mukku
//
//  Created by polyappledev on 2023/05/12.
//


import SwiftUI



struct RapierViewElement: View {
    @State var rapierDegrees : Double = 5
    @State var animationOffset : Double = 0
    
    var size : CGFloat = 12

    var body: some View {
        ZStack{
//            GeometryReader{ geometry in

                    ZStack{
                        Image("rapier1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: size)
                            .rotationEffect(.degrees(rapierDegrees))
                            .offset(x: CGFloat(animationOffset))
                            .onAppear {
                                var animationCycle: () -> Void = {}
                                    animationCycle = {
                                        withAnimation(Animation.easeInOut(duration: 0.3).delay(1)) {
                                            rapierDegrees = -30
                                        }
                                        withAnimation(Animation.easeInOut(duration: 0.3).delay(2)) {
                                            animationOffset = -10
                                        }
                                        withAnimation(Animation.easeIn(duration: 0.5).delay(3)) {
                                            animationOffset = 0
                                            rapierDegrees = 30
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {

                                            animationCycle()
                                        }
                                    }
                                    animationCycle()
                            }
                    }
                    Spacer()
                
                
//            }
        }
        .ignoresSafeArea()
    }
}

struct RapierView : View{
    var body: some View{
        VStack{
            HStack(spacing: 30){
                Spacer()
                RapierViewElement()
                    .scaleEffect(x: -1, y: 1)
                RapierViewElement()
                Spacer()
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}


struct RapierView_Previews: PreviewProvider {
    static var previews: some View {
        RapierView()
    }
}


