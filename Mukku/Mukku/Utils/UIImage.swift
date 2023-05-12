////
////  UIImage.swift
////  Mukku
////
////  Created by Diane on 2023/05/12.
////
//
//import Foundation
//import UIKit
//extension UIImage {
//  func resized(toWidth width: CGFloat, isOpaque: Bool = true) -> UIImage? {
//    let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
//    let format = imageRendererFormat
//    format.opaque = isOpaque
//    return UIGraphicsImageRenderer(size: canvas, format: format).image {
//      _ in draw(in: CGRect(origin: .zero, size: canvas))
//    }
//  }
//}
