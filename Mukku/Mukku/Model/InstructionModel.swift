import SwiftUI

struct Instruction: Hashable {
    var target: String
    var step: Int
    var image: String
    var title: String
    var description: String
}

let widgetInstructions = [
    Instruction(target: "Widget Instruction",
                step: 1, image: "widgetInstruction1",
                title: "홈 화면 위젯 개인 맞춤화하기",
                description: "위젯을 추가하려는 홈 화면 페이지로 이동하여 앱이 흔들릴 때까지 홈 화면 배경을 길게 터치한 다음, 화면 상단의 +을 탭하여 위젯 갤러리를 여세요."),
    Instruction(target: "Widget Instruction",
                step: 2, image: "widgetInstruction2",
                title: "홈 화면 위젯 개인 맞춤화하기",
                description: "스크롤하거나 검색으로 Mukku 위젯을 찾고 탭한 다음, 좌우로 쓸어넘겨 크기 옵션을 둘러보고 위젯 추가를 탭하세요. Mukku는 2가지 크기의 홈 화면 위젯이 있습니다."),
    Instruction(target: "Widget Instruction",
                step: 3, image: "widgetInstruction3",
                title: "홈 화면 위젯 개인 맞춤화하기",
                description: "위젯을 편집하려면, 홈 화면에서 Mukku 위젯을 길게 터치한 다음 위젯 편집을 탭하세요."),
    Instruction(target: "Widget Instruction",
                step: 4, image: "widgetInstruction4",
                title: "홈 화면 위젯 개인 맞춤화하기",
                description: "원하는 뮤지컬 오브젝트와 배경을 선택하세요.")
]

let lockScreenWidgetInstructions = [
    Instruction(target: "Widget Instruction",
                step: 1, image: "widgetInstruction1",
                title: "잠금 화면 개인 맞춤화하기",
                description: "화면 하단에 사용자화 버튼이 표시될 때까지 잠금화면을 길게 터치한 다음 사용자화를 탭하고 좌측 잠금화면을 탭하세요."),
    Instruction(target: "Widget Instruction",
                step: 2, image: "widgetInstruction2",
                title: "잠금 화면 개인 맞춤화하기",
                description: "시간 아래에 있는 상자를 탭하고 Mukku 위젯을 찾아 탭하여 잠금 화면에 위젯을 추가하세요. Mukku는 2가지 크기의 잠금 화면 위젯이 있습니다."),
    Instruction(target: "Widget Instruction",
                step: 3, image: "widgetInstruction3",
                title: "잠금 화면 개인 맞춤화하기",
                description: "위젯을 편집하려면, 추가한 위젯을 한번 더 탭하여 위젯의 오브젝트를 선택합니다.")
]

let dynamicIslandInstructions = [
    Instruction(target: "Dynamic Island Instruction",
                step: 1, image: "widgetInstruction1",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Dynamic Island Instruction",
                step: 2, image: "widgetInstruction2",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Dynamic Island Instruction",
                step: 3, image: "widgetInstruction3",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Dynamic Island Instruction",
                step: 4, image: "widgetInstruction4",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요.")
]

let appleWatchInstructions = [
    Instruction(target: "AppleWatch Instruction",
                step: 1, image: "widgetInstruction1",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "AppleWatch Instruction",
                step: 2, image: "widgetInstruction2",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "AppleWatch Instruction",
                step: 3, image: "widgetInstruction3",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "AppleWatch Instruction",
                step: 4, image: "widgetInstruction4",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요.")
]
