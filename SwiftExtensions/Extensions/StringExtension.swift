//
//  StringExtension.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class StringExtension: NSObject {

}

extension String {
    //return character at index
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    //return String at index
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    //return String in between the range
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start ..< end])
    }
}

//
extension String {
    
    //split a given string into an array, according to a given size
    func splitByLength(_ length: Int) -> [String] {
        var result = [String]()
        var collectedCharacters = [Character]()
        collectedCharacters.reserveCapacity(length)
        var count = 0
        
        for character in self {
            collectedCharacters.append(character)
            count += 1
            if (count == length) {
                // Reached the desired length
                count = 0
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
            }
        }
        
        // Append the remainder
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }
        
        return result
    }
    
}

//Localization related extensions
extension String {
    
    //get the correct localized string from a given file name inside Main Bundle (static)
    func localized(fromFile fileName:String) -> String {
        return self.localized(fromFile: fileName, inBundle: Bundle.main)
    }
    
    //get the correct localized string from a given file name inside chosen Bundle (static)
    func localized(fromFile fileName:String, inBundle bundleChosen: Bundle) -> String{
        return NSLocalizedString(self, tableName: fileName, bundle: bundleChosen, value: "", comment: "")
    }
}
