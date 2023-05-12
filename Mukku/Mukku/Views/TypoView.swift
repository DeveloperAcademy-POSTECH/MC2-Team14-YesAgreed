import SwiftUI

struct TypoView: View {
    @State var isAnimated : Bool = false
    @State var isAnimated2 : Bool = false
    var size : CGFloat = 5
    var body: some View {
        VStack{
            VStack{
                Image("typo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                    .offset(CGSize(width: 0, height: isAnimated ? -5 : 0))
                    .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true), value: isAnimated)
                    .onAppear{
                        isAnimated = true
                    }
                    Spacer()
            }
            
        }.ignoresSafeArea()
    }
}

struct TypoView_Previews: PreviewProvider {
    static var previews: some View {
        TypoView()
    }
}
