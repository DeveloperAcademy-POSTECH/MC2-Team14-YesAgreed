import SwiftUI

struct ObjectView: View {
    @State private var isTapped = false
    var isSelected : Bool = false
    var text: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .center){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(isSelected ? Color.green: Color.clear, lineWidth: 3)
                )
            Text(text)
                .font(.caption)
                .foregroundColor(Color("color_font_black"))
                .textCase(nil)
        }
    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
