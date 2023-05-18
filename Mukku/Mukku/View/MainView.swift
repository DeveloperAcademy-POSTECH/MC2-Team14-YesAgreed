import SwiftUI
import ActivityKit
import PhotosUI

extension UIScreen{
    static let imageBoxSize = UIScreen.main.bounds.size.width / CGFloat(twoColumnsGrid.count) - 10
}

private var twoColumnsGrid = [GridItem(.flexible()), GridItem(.flexible())]

struct MainView: View {
    @State private var isAppLaunchedFirstTime : Bool = true
    @State private var isTrackingTime : Bool = false
    @State private var activity: Activity<MukkuWidgetsAttributes>? = Activity<MukkuWidgetsAttributes>.activities.first
    @State private var startTime: Date? = nil
    @State var dynamicEnabled: Bool = true
    @State var dynamicIslandScene: String = ""
    @State var selectedScene: String = ""
    
    let screenWidth = UIScreen.main.bounds.size.width
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 4) // 그리드 여백
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationStack{
            ZStack{
                Form {
                    Section (header: VStack {
                        ForEach(MusicalModel.musicalModels, id:\.self){ musical in
                            Text(LocalizedStringKey(musical.title))
                                .bold()
                                .foregroundColor(Color("color_font_black"))
                                .font(.system(size: 23))
                                .textCase(nil)
                                .frame(maxWidth: .infinity, alignment: .leading)       
                            LazyVGrid(columns: columns) {
                                ForEach(musical.scene, id:\.self) { scene in
                                    Button {
                                        feedbackGenerator.impactOccurred()
                                        dynamicIslandScene = musical.title + scene.name
                                        selectedScene = scene.name.lowercased()
                                        // Dynamic island update
                                        let updatedState = MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene)
                                        let updatedContent = ActivityContent(state: updatedState, staleDate: .now.advanced(by: 0.01))
                                        Task {
                                            await activity?.update(updatedContent)
                                        }
                                    } label: {
                                        ObjectView(isSelected: dynamicIslandScene == musical.title + scene.name, text: scene.name, imageName: scene.icon)}
                                    .animation(nil, value: self.dynamicIslandScene)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                        Text("The selected object is displayed on the dynamic island.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("color_font_black"))
                            .padding(.bottom)
                        
                    }
                        .frame(width: screenWidth * 0.85) // 그리드 폭 조절
                        .padding(.bottom, -20)
                             
                    ){
                    }
                    Section(footer: Text("You can toggle the object on your dynamic island")) {
                Toggle(
                    "Home Screen Dynamic Island",
                    isOn: $isTrackingTime).onChange(of:isTrackingTime) { _ in
                        if isTrackingTime {
                            startTime = .now
                            Task{
                                //강제종료로 인한 에러 캐치및 처리
                                if activity != nil && isAppLaunchedFirstTime{
                                    await activity?.end(ActivityContent(state: MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene), staleDate: .now.advanced(by: 0.01)), dismissalPolicy: .immediate)
                                    isAppLaunchedFirstTime = false
                                }
                                //Start the live Activity
                                let attributes = MukkuWidgetsAttributes()
                                let state = MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene)
                                let content =
                                ActivityContent(state: state, staleDate: .now.advanced(by: 0.01))
                                activity = try? Activity<MukkuWidgetsAttributes>.request(
                                    attributes: attributes,
                                    content: content
                                )
                            }
                        } else {
                            //End the live Activity
                            guard let startTime else{return}
                            let state = MukkuWidgetsAttributes.ContentState(startTime: startTime, scene: selectedScene)
                            let content = ActivityContent(state: state, staleDate: .now.advanced(by: 0.01))
                            Task{await activity?.end(content, dismissalPolicy: .immediate)}
                            self.startTime = nil
                        }
                    }}
                    Section(header: Text("Instruction")) {
                        NavigationLink(destination: InstructionView(target: widgetInstructions)){Text("Home Widget")}
                        NavigationLink(destination: InstructionView(target: lockScreenWidgetInstructions)){Text("Lock Screen Widget")}
                        NavigationLink(destination: InstructionView(target: dynamicIslandInstructions)){Text("Dynamic Island")}
                        NavigationLink(destination: InstructionView(target: appleWatchInstructions)){Text("Apple Watch")}
                    }
                    
                    Section(header: Text("Widget Background Instruction")) {
                        NavigationLink(destination: BackgroundView()){Text("Transparent Widget Background Instruction")}
                    }
                }
                // Dynamic Object 애니메이션
                switch dynamicIslandScene {
                case let scene where scene.contains("Mask"):
                    MaskView()
                case let scene where scene.contains("Chandelier"):
                    if (UIDevice.current.name == "iPhone 14 Pro Max") || (UIDevice.current.name == "iPhone" && Int(UIScreen.main.bounds.size.width) == 430 && Int(UIScreen.main.bounds.size.height) == 932) {
                        ChandelierView()
                            .offset(y: -42)
                    } else {
                        ChandelierView()
                    }
                case let scene where scene.contains("Boat"):
                    BoatView()
                case let scene where scene.contains("Rose"):
                    RoseView()
                case let scene where scene.contains("Sunflower"):
                    SunFlowerView()
                case let scene where scene.contains("Rapier"):
                    RapierView()
                case let scene where scene.contains("Windmill"):
                    WindMillView()
                case let scene where scene.contains("Typo"):
                    TypoView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ImageManager())
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")
            .environment(\.locale, .init(identifier: "ko"))
        
        MainView()
            .environmentObject(ImageManager())
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
        
        MainView()
            .environmentObject(ImageManager())
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE")
    }
}

