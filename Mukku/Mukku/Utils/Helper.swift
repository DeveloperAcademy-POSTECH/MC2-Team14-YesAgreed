//
//  Helper.swift
//  Mukku
//
//  Created by Diane on 2023/05/11.
//

import Foundation
import SwiftUI

let appGroupName = "group.com.ada2023.Mukku"
let userDefaultsPhotosKey = "photos"


struct Helper {
    
    static func getImageIdsFromUserDefault() -> [String] {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
//            print("===========================================")
//            print("in Helper function")
            
//            print("userDefaults:", userDefaults)
//            print("userDefaults data2:", userDefaults.data(forKey: "29F53808-0302-43BD-AEF6-420A6482B226"))
//
//            if userDefaults.data(forKey: userDefaultsPhotosKey) != nil{
//                print("userDefaults data5:", userDefaults.data(forKey: userDefaultsPhotosKey)!)
//            } else {
//                print("data is nil")
//            }
//            print(userDefaults.data(forKey: userDefaultsPhotosKey))
            if let data = userDefaults.data(forKey: userDefaultsPhotosKey) {
//                print("data:", data)
                
                return try! JSONDecoder().decode([String].self, from: data)
            } else {
//                print("not exist")
            }
        }
        return [String]()
    }
    
    static func getImageFromUserDefaults(key: String) -> UIImage {
        print("here")
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
//            print("userDefaults2:", userDefaults)
//            print("userDefaults data3:", userDefaults.object(forKey: "29F53808-0302-43BD-AEF6-420A6482B226"))
//
            if let imageData = userDefaults.object(forKey: key) as? Data,
               
                let image = UIImage(data: imageData) {
//                print("imageData:", imageData)
//                print("image:", image)
//                print("** userDefaults should appear:", userDefaults.data(forKey: userDefaultsPhotosKey)!)
                return image
            }
        }
        
        return UIImage(systemName: "photo.fill.on.rectangle.fill")!
    }
}

