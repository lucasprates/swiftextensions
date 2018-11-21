//
//  UIImageExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class UIImageExtensions: NSObject {
    
}

extension UIImage {
    
    //Round the four corners of any given UIImage, making it a circle
    var roundedImage: UIImage {
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
            ).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func resizeImageWidth(newSize cgSize: CGSize) -> UIImage {
        //Resizes an image on its largest size by a given size, respecting its previous aspect ratio
        let horizontalRatio = cgSize.width / self.size.width
        let verticalRatio = cgSize.height / self.size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: self.size.width * horizontalRatio, height: self.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    //Get the color of the pixel at desired point
    func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData: CFData? = self.cgImage?.dataProvider?.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
