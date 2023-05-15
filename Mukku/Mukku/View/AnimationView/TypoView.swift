import SwiftUI

struct TypoView: View {
    @State private var isAnimating = false
    var body: some View {
            VStack{
                if UIDevice.current.name == "iPhone 14 Pro Max" {
                    Image("typo1")
                        .resizable()
                        .scaledToFit()
                        .frame(height:15)
                        .throwAnimation(isAnimating: $isAnimating)
                        .onAppear {
                            isAnimating.toggle()
                        }
                    } else {
                        Image("typo1")
                            .resizable()
                            .scaledToFit()
                            .frame(height:15)
                            .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true),
                            value: isAnimating)
                            .onAppear {self.isAnimating = true}
                            .onAppear()
                        
                    }
                
                Spacer()
            }.ignoresSafeArea()
    }
}

struct ThrowAnimationWrapper<Content: View>: UIViewRepresentable{
    @ViewBuilder let content: () -> Content
    @Binding var isAnimating: Bool
    func makeUIView(context: Context) -> UIView {
        UIHostingController(rootView: content()).view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let totalStep : Double = 15
        if isAnimating{
            UIView.animateKeyframes(withDuration: 4, delay: 0.0, options: [.repeat], animations: {
                //시작 01
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration:0.0, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center = CGPoint(x: 340, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //Move to right 02
                UIView.addKeyframe(withRelativeStartTime: 1/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center = CGPoint(x: 340+12.5, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
//                //Move to right 03
                UIView.addKeyframe(withRelativeStartTime: 2/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340+25, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
//                //Move to right 04
                UIView.addKeyframe(withRelativeStartTime: 3/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340+37.5, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
//                //05
                UIView.addKeyframe(withRelativeStartTime: 4/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340+50, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //06
                UIView.addKeyframe(withRelativeStartTime: 5/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340+60, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //07
                UIView.addKeyframe(withRelativeStartTime: 6/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340+70, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //08
                UIView.addKeyframe(withRelativeStartTime: 7/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //Rotate to left
                //09
                UIView.addKeyframe(withRelativeStartTime: 8/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-12.5, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //10
                UIView.addKeyframe(withRelativeStartTime: 9/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-25, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //10
                UIView.addKeyframe(withRelativeStartTime: 10/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-37.5, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //11
                UIView.addKeyframe(withRelativeStartTime: 11/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-50, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //11
                UIView.addKeyframe(withRelativeStartTime: 12/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-60, y: -416-8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //12
                UIView.addKeyframe(withRelativeStartTime: 13/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 80-70, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //13
                UIView.addKeyframe(withRelativeStartTime: 14/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
                    uiView.center =  CGPoint(x: 340, y: -416-4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
            }
                                    ,completion: { _ in
                uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
            })
        }
    }
}

extension View {
    func throwAnimation( isAnimating: Binding<Bool>) -> some View {
        modifier(ThrowAnimationViewModifier(isAnimating: isAnimating))
    }
}
struct ThrowAnimationViewModifier: ViewModifier {
    @Binding var isAnimating: Bool
    func body(content: Content) -> some View {
        ThrowAnimationWrapper(content: {
            content
        }, isAnimating: $isAnimating)
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
