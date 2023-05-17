//
//  Helper.swift
//  Mukku
//
//  Created by Diane on 2023/05/11.
//

import Foundation
import SwiftUI

let appGroupName = "group.com.appleDeveloperAca.Mukku"
let userDefaultsPhotosKey = "photos"


struct Helper {
    
    static func getImageIdsFromUserDefault() -> [String] {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {

            if let data = userDefaults.data(forKey: userDefaultsPhotosKey) {
                return try! JSONDecoder().decode([String].self, from: data)
            } else {
            }
        }
        return [String]()
    }
    
    static func getImageFromUserDefaults(key: String) -> UIImage {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            if let imageData = userDefaults.object(forKey: key) as? Data,
               
                let image = UIImage(data: imageData) {
                return image
            }
        }
        
        return UIImage(systemName: "photo.fill.on.rectangle.fill")!
    }
}

