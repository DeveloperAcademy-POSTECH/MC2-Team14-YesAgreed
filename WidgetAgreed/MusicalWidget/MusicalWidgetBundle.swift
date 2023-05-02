//
//  MusicalWidgetBundle.swift
//  MusicalWidget
//
//  Created by polyappledev on 2023/05/01.
//

import WidgetKit
import SwiftUI

@main
struct MusicalWidgetBundle: WidgetBundle {
    var body: some Widget {
        MusicalWidget()
        MusicalWidgetLiveActivity()
    }
}
