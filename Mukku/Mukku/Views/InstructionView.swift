//
//  InstructionView.swift
//  Mukku
//
//  Created by Diane on 2023/05/16.
//

import Foundation
import SwiftUI

struct InstructionView: View {
    var instruction: String
    var body: some View {
        Text(instruction)
            .navigationBarTitle("Instruction")
    }
}


//struct InstructionView_Previews: PreviewProvider {
//    static var previews: some View {
//        InstructionView()
//    }
//}

