import SwiftUI

struct Instruction: Hashable {
    var target: String
    var step: Int
    var image: String
    var description: String
}

let widgetInstructions = [
    Instruction(target: "Widget Instruction",
                step: 1, image: "HomeWidgetInstruction1",
                description: "Swipe left all the way to the end. Tap a complication to select it, then turn the Digital Crown to choose Mukku complication. There are four different types of Mukku complications."),
    Instruction(target: "Widget Instruction",
                step: 2, image: "HomeWidgetInstruction2",
                description: "Scroll or search to find Mukku widget, tap it, then swipe left and right through the size options. When you see the size you want, tap Add Widget. There are two different sizes of Mukku widgets."),
    Instruction(target: "Widget Instruction",
                step: 3, image: "HomeWidgetInstruction3",
                description: "You can customize widgets. On your Home Screen, touch and hold Mukku widget, then tap Edit Widget."),
    Instruction(target: "Widget Instruction",
                step: 4, image: "HomeWidgetInstruction4",
                description: "Choose options to select the musical object and the widget background.")
]

let lockScreenWidgetInstructions = [
    Instruction(target: "Widget Instruction",
                step: 1, image: "LockWidgetInstruction1",
                description: "Touch and hold the Lock Screen until the Customize button appears at the bottom of the screen. Tap Customize, then tap Lock Screen on the left."),
    Instruction(target: "Widget Instruction",
                step: 2, image: "LockWidgetInstruction2",
                description: "Tap the box below the time. Find Mukku widget and tap it to add widgets to your Lock Screen. There are two different sizes of Mukku widgets."),
    Instruction(target: "Widget Instruction",
                step: 3, image: "LockWidgetInstruction3",
                description: "You can customize widgets. On your Lock Screen, touch Mukku widget once more to edit widget.")
]

let dynamicIslandInstructions = [
    Instruction(target: "Dynamic Island Instruction",
                step: 1, image: "DynamicIslandInstruction1",
                description: "On iPhone 14 Pro and iPhone 14 Pro Max, you can see animations of musical objects around the Dynamic Island in Mukku app when you tap the object."),
    Instruction(target: "Dynamic Island Instruction",
                step: 2, image: "DynamicIslandInstruction2",
                description: "On iPhone 14 Pro and iPhone 14 Pro Max, you can see musical objects in the Dynamic Island on the Home Screen when you tap the object and toggle the dynamic island setting.")
]

let appleWatchInstructions = [
    Instruction(target: "AppleWatch Instruction",
                step: 1, image: "AppleWatchInstruction1",
                description: "With the watch face showing, touch and hold the display, then tap Edit."),
    Instruction(target: "AppleWatch Instruction",
                step: 2, image: "AppleWatchInstruction2",
                description: "Swipe left all the way to the end. Tap a complication to select it, then turn the Digital Crown to choose Mukku complication. There are four different types of Mukku complications.")
]
