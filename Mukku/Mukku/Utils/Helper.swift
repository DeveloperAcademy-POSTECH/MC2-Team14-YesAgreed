//
//  Helper.swift
//  Mukku
//
//  Created by Diane on 2023/05/11.
//

import Foundation
import SwiftUI

let appGroupName = "group.Mukku"
let userDefaultsPhotosKey = "photos"


struct Helper {
    
    static func getImageIdsFromUserDefault() -> [String] {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            print("userDefaults:", userDefaults)
            if let data = userDefaults.data(forKey: userDefaultsPhotosKey) {
                print("data:", data)
                return try! JSONDecoder().decode([String].self, from: data)
            }
        }
        return [String]()
    }
    
    static func getImageFromUserDefaults(key: String) -> UIImage {
        print("here")
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            print("userDefaults2:", userDefaults)
            if let imageData = userDefaults.object(forKey: key) as? Data,
               
                let image = UIImage(data: imageData) {
                print("imageData:", imageData)
                return image
            }
        }
        
        return UIImage(systemName: "photo.fill.on.rectangle.fill")!
    }
}

