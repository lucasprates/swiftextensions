//
//  NSMutableAttributedStringExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class NSMutableAttributedStringExtensions: NSObject {

}

extension NSMutableAttributedString {
    //append to an attributed string a txt with chosen font (type, size) and a color
    func attrStr(text: String, font: UIFont, textColor: UIColor) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ]
        let string = NSMutableAttributedString(string: text, attributes: attributes)
        self.append(string)
        return self
    }
}
