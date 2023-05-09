//
//  MusicalModel.swift
//  Mukku
//
//  Created by 김혜린 on 2023/05/09.
//

import SwiftUI

struct MusicalModel : Hashable{
    var title : String
    var scene : [MyScene]
}
struct MyScene : Hashable {
    var name : String
    var icon : String
}
extension MusicalModel{
    static var musicalModels : [MusicalModel] =
    [   //Phantom Of Opera
        MusicalModel(title: "Phantom of the Opera",
                     scene: [
                        MyScene(name: "Mask", icon: "PhantomIcon1"),
                        MyScene(name: "Chandelier", icon: "PhantomIcon2"),
                        MyScene(name: "Boat",icon: "PhantomIcon3"),
                        MyScene(name: "Sunflower", icon: "PhantomIcon4"),
                     ]),
        //Man of La Mancha
        MusicalModel(title: "Man of La Mancha",
                     scene: [
                        MyScene(name: "Sunflower", icon: "LamanchaIcon1"),
                        MyScene(name: "Rapier", icon: "LamanchaIcon2"),
                        MyScene(name: "Windmill",icon: "LamanchaIcon3"),
                        MyScene(name: "Typo", icon: "LamanchaIcon4"),
                     ])
    ]
}

