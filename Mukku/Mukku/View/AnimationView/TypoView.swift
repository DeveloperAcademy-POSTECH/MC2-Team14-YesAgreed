import SwiftUI

struct TypoView: View {
    @State var yOffset : CGFloat = 6
    @State var xOffset : CGFloat = 30
    @State var xScale : CGFloat = -1
    
    var body: some View {
        GeometryReader{ geometry in
                Image("typo1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 17)
                    .position(x: xOffset+(geometry.size.width)/2,y:yOffset) //180
                    .scaleEffect(
                        x:xScale,
                        anchor: UnitPoint(
                            x: (xOffset/geometry.size.width) + 0.5,
                            y: 0.5)) //전체 위치중 중간값
                    .onAppear {
                        let totalTime : CGFloat = 2
                        let totalStep : CGFloat = 15
                        let tmPrStp = totalTime/totalStep
                        var animationCycle: () -> Void = {}
                            animationCycle = {
                                // 01
                                withAnimation(Animation.linear(duration : tmPrStp).delay(0*tmPrStp)) {
                                    xOffset = -40+12.5*0
                                    yOffset = 6
                                }
                                // 02
                                withAnimation(Animation.linear(duration: tmPrStp).delay(1*tmPrStp)) {
                                    xOffset = -40+12.5*1
                                    yOffset = 0
                                }
                                // 03
                                withAnimation(Animation.linear(duration: tmPrStp).delay(2*tmPrStp)) {
                                    xOffset = -40+12.5*2
                                    yOffset = 6
                                }
                                //04
                                withAnimation(Animation.linear(duration: tmPrStp).delay(3*tmPrStp)) {
                                    xOffset = -40+12.5*3
                                    yOffset = 0
                                }
                                //05
                                withAnimation(Animation.linear(duration: tmPrStp).delay(4*tmPrStp)) {
                                    xOffset = -40+12.5*4
                                    yOffset = 6
                                }
                                //06
                                withAnimation(Animation.linear(duration: tmPrStp).delay(5*tmPrStp)) {
                                    xOffset = -40+12.5*5
                                    yOffset = 0
                                }
                                //07
                                withAnimation(Animation.linear(duration: tmPrStp).delay(6*tmPrStp)) {
                                    xOffset = -40+12.5*6
                                    yOffset = 6
                                }
                                //08
                                withAnimation(Animation.linear(duration: tmPrStp).delay(7*tmPrStp)) {
                                    xOffset = -40+12.5*6
                                    yOffset = 6
                                    xScale = 1
                                }
                                //09
                                withAnimation(Animation.linear(duration: tmPrStp).delay(9*tmPrStp)) {
                                    xOffset = -40+12.5*5
                                    yOffset = 0
                                }
                                //10
                                withAnimation(Animation.linear(duration: tmPrStp).delay(10*tmPrStp)) {
                                    xOffset = -40+12.5*4
                                    yOffset = 6
                                }
                                //11
                                withAnimation(Animation.linear(duration: tmPrStp).delay(11*tmPrStp)) {
                                    xOffset = -40+12.5*3
                                    yOffset = 0
                                }
                                //12
                                withAnimation(Animation.linear(duration: tmPrStp).delay(12*tmPrStp)) {
                                    xOffset = -40+12.5*2
                                    yOffset = 6
                                }
                                //13
                                withAnimation(Animation.linear(duration: tmPrStp).delay(13*tmPrStp)) {
                                    xOffset = -40+12.5*1
                                    yOffset = 0
                                }
                                //14
                                withAnimation(Animation.linear(duration: tmPrStp).delay(14*tmPrStp)) {
                                    xOffset = -40
                                    yOffset = 6
                                }
                                //15
                                withAnimation(Animation.linear(duration: tmPrStp).delay(15*tmPrStp)) {
                                    xOffset = -40
                                    xScale = -1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + totalTime) {
                                    animationCycle()
                                }
                            }
                            animationCycle()
            }
        }.ignoresSafeArea()
    }
}


struct TypoView_Previews: PreviewProvider {
    static var previews: some View {
        TypoView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")
        
        TypoView()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
