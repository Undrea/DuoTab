//
//  UIImage+imageWithColor.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-12.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import UIKit

extension UIImage {
  /**
   Setting the tint colour is only available on UIImageViews; this function allows for creating a
   UIImage with the specified fill colour, similar to the tint colour setting.
   
   Note: UIImage is generally a vector; UIImageRenderingMode will be set to .alwaysOriginal.
   Adapted from: http://stackoverflow.com/questions/19274789/how-can-i-change-image-tintcolor-in-ios-and-watchkit (user "Fuzz")
   
   - parameter color: The desired fill colour for the image.
   
   - returns: An image filled with the specified colour and maintaining any transparency.
   */
  func imageWithColor(_ color: UIColor) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
    color.setFill()
    
    let context = UIGraphicsGetCurrentContext()! as CGContext
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1.0, y: -1.0);
    context.setBlendMode(CGBlendMode.normal)
    
    let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
    context.clip(to: rect, mask: self.cgImage!)
    context.fill(rect)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
    UIGraphicsEndImageContext()
    
    return newImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal) // Apply this rendering mode to change a vector image's colour
  }
}
