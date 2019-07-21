//
//  TestArrayExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TestArrayExtensions: XCTestCase {
    
    var arrayToTest: Array<String> = []

    override func setUp() {
        self.arrayToTest = ["0", "1", "2", "3", "a", "b", "c", "d"]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSendElementToTheEnd() {
        //Testing sending different elements to the end of an array
        for i in (0...4).reversed(){
            let oldStringAtPosition = self.arrayToTest[i]
            self.arrayToTest.sendElementToTheEnd(fromIndex: i)
            
             XCTAssertTrue(self.arrayToTest.last == oldStringAtPosition, "Element sent to the end of the Array does not match what it was intented to be at index " + i.description)
        }
    }

    func testStablePartition(){
        //Testing stable partition method using letters and numbers in an array, dividing them by which one can be represented as a integer number (dividing between numbers and letters)
        let arrayPartitionResult: ([String], [String]) = self.arrayToTest.stablePartition(by: { Int($0) != nil })
        
        for stringNumbersInArray in arrayPartitionResult.0{
            //check for numbers as string
            XCTAssertTrue(Int(stringNumbersInArray) != nil, "Array partition not dividing string array correctly in numbers between numbers and letters")
        }
        
        for stringLettersInArray in arrayPartitionResult.1{
            //check for numbers as string
            XCTAssertTrue(Int(stringLettersInArray) == nil, "Array partition not dividing string array correctly in letters between numbers and letters")
        }
    }

    func testObjectRemoval(){
        //Testing if removal of specific object from an array is working correctly
        let previousArrayCount = arrayToTest.count
        
        //doign the actual removal
        self.arrayToTest.remove(object: "0")
        
        //testing if an element was removed, and if that element is 0
        let isCountOneLess = (previousArrayCount - 1) == self.arrayToTest.count
        let firstElementIsDifferent = self.arrayToTest.first ?? "" != "0"
        XCTAssertTrue(isCountOneLess && firstElementIsDifferent)
    }
}
