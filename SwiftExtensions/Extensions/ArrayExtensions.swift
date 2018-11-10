//
//  ArrayExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class ArrayExtensions: NSObject {

}

extension Array {
    
    //send the chosen element to the end of the array (POP + PUSH)
    mutating func sendElementToTheEnd(fromIndex indexToSend: Int){
        let element = self.remove(at: indexToSend)
        self.append(element)
    }
    
    //creates two arrays, separating elements based on a condition. True is first [0], False is second [1]
    func stablePartition(by condition: (Element) -> Bool) -> ([Element], [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            if condition(element) {
                matching.append(element)
            } else {
                nonMatching.append(element)
            }
        }
        return (matching, nonMatching)
    }
}
