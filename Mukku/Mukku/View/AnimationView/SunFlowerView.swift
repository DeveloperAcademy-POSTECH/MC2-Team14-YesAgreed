import SwiftUI

struct SunFlowerViewElement: View {
    @State var isAnimated : Bool = false
    var size : CGFloat = 7
    var body: some View {
                ZStack{
                    Image("stem")
                        .resizable()
                        .scaledToFit()
                        .frame(width:size)
                    VStack{
                        Image("flower")
                            .resizable()
                            .scaledToFit()
                            .frame(width:size)
                            .rotationEffect(Angle(degrees: isAnimated ? 10:0))
                            .animation(
                                Animation.easeInOut(duration: 3)
                                    .repeatForever(autoreverses: true),
                                value: isAnimated)
                            .onAppear {self.isAnimated = true}
                        Spacer().frame(height: size * 1.6)
                    }
                }.rotationEffect(Angle(degrees: isAnimated ? -10:10),anchor: .bottom)
                    .animation(Animation
                        .easeInOut(duration: 3)
                        .repeatForever(autoreverses: true),
                               value: isAnimated)
                    .onAppear {self.isAnimated = true}
            
    }
}

struct SunFlowerView : View{
    var body: some View{
        VStack{
            HStack(spacing: 25){
                SunFlowerViewElement()
                SunFlowerViewElement()
                SunFlowerViewElement()
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SunFlowerView_Previews: PreviewProvider {
    static var previews: some View {
        SunFlowerView()
    }
}
