//
//  TestUIColorExtensions.swift
//  SwiftExtensionsTests
//
//  Created by Lucas on 21/11/2018.
//

import XCTest

class TestUIColorExtensions: XCTestCase {
    
    var colorRep1: UIColor?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let imageToTest: UIImage? = UIImage(named: "square", in: Bundle(for: type(of: self)), compatibleWith: nil)
        colorRep1 = imageToTest?.getPixelColor(pos: CGPoint(x: 0, y: 0))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsEqualToColor() {
        //Check if color is the same as a chosen one to compate
        let colorRep2: UIColor? = UIColor(red: 253.0/255.0, green: 232.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        XCTAssertTrue((colorRep1?.isEqualToColor(colorToCompare: colorRep2) ?? false), "The two UIColors compared should have been the same")
        
        let wrongColor: UIColor = UIColor.darkGray
        XCTAssertFalse((colorRep1?.isEqualToColor(colorToCompare: wrongColor) ?? false), "The two UIColors compared should NOT have been the same")
    }

}
