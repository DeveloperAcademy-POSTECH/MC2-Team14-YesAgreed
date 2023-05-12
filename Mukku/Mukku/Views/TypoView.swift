import SwiftUI

struct TypoView: View {
    @State private var isAnimating = false
    var body: some View {
            VStack{
                Image("typo1")
                    .resizable()
                    .scaledToFit()
                    .frame(height:15)
                    .throwAnimation(isAnimating: $isAnimating)
                    .onAppear {
                        isAnimating.toggle()
                    }
            }.ignoresSafeArea()
    }
}

struct ThrowAnimationWrapper<Content: View>: UIViewRepresentable{
    @ViewBuilder let content: () -> Content
    @Binding var isAnimating: Bool
    func makeUIView(context: Context) -> UIView {
        UIHostingController(rootView: content()).view
    }
//    fileprivate func hello(_ uiView: UIView, x:Int, startTime:Double) {
//        UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: 2, animations: {
//            uiView.center =  CGPoint(x: x, y: 290)
//            uiView.transform = CGAffineTransform(rotationAngle: 0)
//        })
//        UIView.addKeyframe(withRelativeStartTime: startTime + 0.1, relativeDuration: 3, animations: {
//            uiView.center =  CGPoint(x: x + 20, y: 280 )
//            uiView.transform = CGAffineTransform(rotationAngle: -0.4)
//        })
//        UIView.addKeyframe(withRelativeStartTime: startTime + 0.2, relativeDuration: 2, animations: {
//            uiView.center =  CGPoint(x: x + 40, y: 300)
//            uiView.transform = CGAffineTransform(rotationAngle: 0)
//        })
//    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let totalStep : Double = 15
        if isAnimating{
            UIView.animateKeyframes(withDuration: 4, delay: 0.0, options: [.repeat], animations: {
                //시작 01
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration:0.0, animations: {
                    uiView.center =  CGPoint(x: 160, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //Move to right 02
                UIView.addKeyframe(withRelativeStartTime: 1/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+12.5, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //Move to right 03
                UIView.addKeyframe(withRelativeStartTime: 2/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+25, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //Move to right 04
                UIView.addKeyframe(withRelativeStartTime: 3/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+37.5, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //05
                UIView.addKeyframe(withRelativeStartTime: 4/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+50, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //06
                UIView.addKeyframe(withRelativeStartTime: 5/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+60, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //07
                UIView.addKeyframe(withRelativeStartTime: 6/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+70, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: -1, y: 1)
                })
                //08
                UIView.addKeyframe(withRelativeStartTime: 7/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 160+70, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //Rotate to left
                //09
                UIView.addKeyframe(withRelativeStartTime: 8/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-12.5, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //10
                UIView.addKeyframe(withRelativeStartTime: 9/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-25, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //10
                UIView.addKeyframe(withRelativeStartTime: 10/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-37.5, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //11
                UIView.addKeyframe(withRelativeStartTime: 11/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-50, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //11
                UIView.addKeyframe(withRelativeStartTime: 12/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-60, y: -8)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //12
                UIView.addKeyframe(withRelativeStartTime: 13/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-70, y: -4)
                    uiView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                //13
                UIView.addKeyframe(withRelativeStartTime: 14/totalStep, relativeDuration:1/totalStep, animations: {
                    uiView.center =  CGPoint(x: 230-70, y: -4)
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
    }
}
