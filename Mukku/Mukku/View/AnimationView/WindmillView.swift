import SwiftUI

struct WindmillViewElement: View {
    @State var isAnimated : Bool = false
    var size: CGFloat = 5
    var body: some View {
            ZStack{
                Image("house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
                VStack{
                    Image("wing")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size*2)
                        .rotationEffect(Angle(degrees: isAnimated ? 360:0))
                        .animation(
                            Animation
                                .linear(duration: 2)
                                .repeatForever(autoreverses: false),
                            value: isAnimated)
                        .onAppear {self.isAnimated = true}
                    Spacer().frame(height: size*0.8)}
            }
    }
}

struct WindMillView: View {
    var body: some View {
        VStack{
            WindmillViewElement()
        Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct WindmillView_Previews: PreviewProvider {
    static var previews: some View {
        WindMillView()
    }
}
