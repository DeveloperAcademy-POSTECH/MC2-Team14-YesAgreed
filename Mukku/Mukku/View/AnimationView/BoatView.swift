import SwiftUI

let boatPositions: [CGPoint] = [
    CGPoint(x: 0.36, y: 0.008),
    CGPoint(x: 0.6, y: 0.008),
]

struct BoatView: View {
    @State var animationTime : Int = 0
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                HStack{
                    Spacer()
                    ZStack{
                                Image("boat1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 17, height: 17)
                                    .position(x: boatPositions[animationTime].x * geometry.size.width, y: boatPositions[animationTime].y * geometry.size.height)
                                    .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 5).delay(1).repeatForever(autoreverses: true)) {
                                    animationTime = 1
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
struct BoatView_Previews: PreviewProvider {
    static var previews: some View {
        BoatView()
    }
}


