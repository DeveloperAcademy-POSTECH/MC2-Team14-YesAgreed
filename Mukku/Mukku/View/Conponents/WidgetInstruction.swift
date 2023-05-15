import SwiftUI

struct WidgetInstruction: View {
    var body: some View {
        Section() {
            Label {
                Text("Widget Instruction")
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
            } icon: {
                Image(systemName: "info.circle")
                    .padding(EdgeInsets(top: 0, leading: -15, bottom: 0, trailing: 0))
            }
            .alignmentGuide(.listRowSeparatorLeading) {
                ViewDimensions in
                return -19.5
            }
            Text("You can add the Home screen widget and the Lock screen widget directly with a long press gesture on the screen. You can select objects and backgrounds in the Edit Widgets window.")
                .font(.system(size: 15))
        }
    }
}

struct WidgetInstruction_Previews: PreviewProvider {
    static var previews: some View {
        WidgetInstruction()
    }
}
