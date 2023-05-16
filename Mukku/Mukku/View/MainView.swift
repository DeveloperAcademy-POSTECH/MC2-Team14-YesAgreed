import SwiftUI
import ActivityKit
import PhotosUI

extension UIScreen{
    static let imageBoxSize = UIScreen.main.bounds.size.width / CGFloat(twoColumnsGrid.count) - 10
}

private var twoColumnsGrid = [GridItem(.flexible()), GridItem(.flexible())]

struct MainView: View {
    @State private var isTrackingTime : Bool = false
    @State private var activity: Activity<MukkuWidgetsAttributes>? = nil
    @State private var startTime: Date? = nil
    @State var dynamicEnabled: Bool = true
    @State var dynamicIslandScene: String = ""
    @State var selectedScene: String = ""
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    @EnvironmentObject var imageManager: ImageManager
    @State private var showImagePicker = false
    @State private var image = UIImage()
    @State var backgroundEnabled: Bool = false

    
    let screenWidth = UIScreen.main.bounds.size.width
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 4) // 그리드 여백
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationStack{
            ZStack{
                Form {
                    Section (header:
                                VStack {
                                    Text("Dynamic Island")
                    .bold()
                    .foregroundColor(Color("color_font_black"))
                    .font(.system(.title))
                    .textCase(nil)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
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
                                        let updatedContent = ActivityContent(state: updatedState, staleDate: .now.advanced(by: 1800.0))
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
                    }
                        .frame(width: screenWidth * 0.85) // 그리드 폭 조절
                        .padding(.bottom, -20)
                    ){
                    }
                    Section(footer: Text("토글 시 선택한 오브젝트가 홈 화면 다이나믹 아일랜드에서 보입니다.")) {
                Toggle(
                    "Home Screen Dynamic Island",
                    isOn: $isTrackingTime).onChange(of:isTrackingTime) { _ in
                        if isTrackingTime {
                            startTime = .now
                            //Start the live Activity
                            let attributes = MukkuWidgetsAttributes()
                            let state = MukkuWidgetsAttributes.ContentState(startTime: .now, scene: selectedScene)
                            let content =
                            ActivityContent(state: state, staleDate: .now.advanced(by: 3600.0))
                                    
                                    activity = try? Activity<MukkuWidgetsAttributes>.request(
                                        attributes: attributes,
                                        content: content )
                                } else {
                                    //End the live Activity
                                    guard let startTime else{return}
                                    let state = MukkuWidgetsAttributes.ContentState(startTime: startTime, scene: selectedScene)
                                    let content = ActivityContent(state: state, staleDate: .now.advanced(by: 3600.0))
                                    Task{await activity?.end(content, dismissalPolicy: .immediate)}
                                    self.startTime = nil
                                }
                            }
                    }
                    Section(header: Text("Instruction")) {
                        NavigationLink(destination: WidgetInstructionView()){Text("Widget")}
                        NavigationLink(destination: WidgetInstructionView()){Text("Dynamic Island")}
                        NavigationLink(destination: WidgetInstructionView()){Text("Apple Watch")}
                    }
                    
                    Section(header: Text("위젯 배경 설정")) {
                        NavigationLink(destination: BackgroundView()){Text("투명한 위젯 배경")}
                    }
                }
                // Dynamic Object 애니메이션
                switch dynamicIslandScene {
                case let scene where scene.contains("Mask"):
                    MaskView()
                case let scene where scene.contains("Chandelier"):
                    if UIDevice.current.name == "iPhone 14 Pro Max" {
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

