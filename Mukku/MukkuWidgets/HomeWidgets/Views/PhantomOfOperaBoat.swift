import SwiftUI

struct PhantomOfOperaBoat: View {
    var count : Int
    var body: some View {
        VStack{
            Text("GhostOfOpera")
            Text("02")
            Text(String(describing: count))
        }
    }
}


struct PhantomOfOperaBoat_Previews: PreviewProvider {
    static var previews: some View {
        PhantomOfOperaBoat(count: 1)
    }
}
