//
//  UIViewExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 21/07/2019.
//

import UIKit

class UIViewExtensions: NSObject {
    
}

extension UIView {
    
    //allows corner radius to be visible in the inspector of the storyboard
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    //allows border width to be visible in the inspector of the storyboard
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    //allows border color to be visible in the inspector of the storyboard
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
