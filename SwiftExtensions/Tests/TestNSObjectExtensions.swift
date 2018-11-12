//
//  NSObjectExtensions.swift
//  SwiftExtensionsTests
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TestNSObjectExtensions: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetClassName() {
        //Test of three class types: (1) Swift iOS SDK's UIImage, (2) NSDate and (3) NSObject
        let aClassObjArray: Array<NSObject> = [UIImage(), NSDate(), NSObject()]
        let aClassNameArray: Array<String> = ["UIImage", "__NSDate", "NSObject"]
        
        for i in 0...aClassNameArray.count-1{
            XCTAssertTrue(aClassObjArray[i].theClassName == aClassNameArray[i], "Class name is different than it should have been for " + aClassNameArray[i])
        }
    }

}
