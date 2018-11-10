//
//  NSObjectExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class NSObjectExtensions: NSObject {

}

extension NSObject {
    
    //return the name of the class, as a string
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}
