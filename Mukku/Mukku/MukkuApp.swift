import SwiftUI
import ActivityKit
@main
struct MukkuApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            VStack{
                ForEach(Activity<MukkuWidgetsAttributes>.activities){ hmhm in
                    Text(String(describing: hmhm.content.state.scene))
                }
                MainView().environmentObject(ImageManager())
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                // 앱이 백그라운드로 전환될 때 실행할 코드
                print("앱이 백그라운드로 전환됨")
                // 앱 종료 또는 필요한 정리 작업 수행
                // 예: 데이터 저장, 리소스 정리 등
            case .inactive:
                // 앱이 비활성화될 때 실행할 코드
                print("앱이 비활성화됨")
            case .active:
                // 앱이 활성화될 때 실행할 코드
                print("앱이 활성화됨")
            @unknown default:
                // 알 수 없는 상태일 때 실행할 코드
                break
            }
        }
    }
}
