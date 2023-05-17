//
//  ImageManager.swift
//  Mukku
//
//  Created by Diane on 2023/05/11.
//

import SwiftUI
import WidgetKit

final class ImageManager: NSObject, ObservableObject {
    
    @Published var photos = [String]()
    
    // MARK: - SETUP
    override init() {
        super.init()
        
        photos = Helper.getImageIdsFromUserDefault()
    }
    
    func appendImage(image: UIImage) {
        
        // Save image in userdefaults
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            
            // 이부분 compressionQuality가 높으면 이미지가 로딩되지 않음
            if let jpegRepresentation = image.jpegData(compressionQuality: 1) {
                
                let id = UUID().uuidString
                userDefaults.dictionaryRepresentation().keys.forEach { key in
                    userDefaults.removeObject(forKey: key)
                }
                userDefaults.set(jpegRepresentation, forKey: id)

                // Append the list and save
                photos = []

                photos.append(id)
                saveIntoUserDefaults()
                // Notify the widget to reload all items
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }
    
    private func saveIntoUserDefaults() {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            
            let data = try! JSONEncoder().encode(photos)
            userDefaults.set(data, forKey: userDefaultsPhotosKey)
        }
        
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}
