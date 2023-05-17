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
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Widget Instruction",
                step: 2, image: "widgetInstruction2",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Widget Instruction",
                step: 3, image: "widgetInstruction3",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요."),
    Instruction(target: "Widget Instruction",
                step: 4, image: "widgetInstruction4",
                title: "잠금 화면 개인 맞춤화하기",
                description: "즐겨찾는 사진을 추천받고, 색상 및 서체를 선택하고, 새로운 위젯을 추가해 보세요. 잠금 화면을 길게 터치한 다음 사용자화를 탭하거나 버튼을 탭하여 새로운 잠금 화면을 생성하세요.")
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
