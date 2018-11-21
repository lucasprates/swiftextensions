//
//  UIColorExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 21/11/2018.
//

import UIKit

class UIColorExtensions: NSObject {

}

extension UIColor {
    //Check if color is the same as a chosen one to compate
    func isEqualToColor(colorToCompare: UIColor?) -> Bool{
        return (self.cgColor == colorToCompare?.cgColor)
    }
}
