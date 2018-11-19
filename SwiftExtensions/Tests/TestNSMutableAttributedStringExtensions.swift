//
//  TestNSMutableAttributedStringExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TestNSMutableAttributedStringExtensions: XCTestCase {
    
    var newMutableString: NSMutableAttributedString?
    
    //chosen attributes
    let textTest: String = "Test321"
    let fontSizeTest: CGFloat = 16
    let fontNameTest: String = "CourierNewPS-ItalicMT"
    let textColorTest: UIColor = UIColor.lightGray

    override func setUp() {
        //Create Mutable String using new attributes' method with chosen attributes (Three)
        self.newMutableString = NSMutableAttributedString(string: "").attrStr(text: textTest, font: UIFont(name: self.fontNameTest, size: self.fontSizeTest) ?? UIFont(), textColor: self.textColorTest)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAttrStr() {
        //Check if new attributes are on string
        //(1) Text
        XCTAssertTrue(newMutableString?.string ?? "" == "Test321", "Text attribute of NSMutableAttributedString was not correctly added by attrStr() method")
        
        //(2) Font property (Name and Size)
        // 2.1 - Font Name
        let attributes = newMutableString?.attributes(at: 0, effectiveRange: nil)
        let mutableStrFont: UIFont? = attributes?[NSAttributedString.Key.font] as? UIFont
        
        XCTAssertTrue(mutableStrFont?.fontName ?? "" == self.fontNameTest, "Font Name attribute of NSMutableAttributedString was not correctly added by attrStr() method")
//        // 2.2 - Font Size
        XCTAssertTrue(mutableStrFont?.pointSize ?? -1 == self.fontSizeTest, "Font Size attribute of NSMutableAttributedString was not correctly added by attrStr() method")
        
        //3 Color
        let mutableStrColor: UIColor? = attributes?[NSAttributedString.Key.foregroundColor] as? UIColor
        XCTAssertTrue(mutableStrColor == self.textColorTest, "Color attribute of NSMutableAttributedString was not correctly added by attrStr() method")
    }

}
