//
//  TextStringExtensions.swift
//  SwiftExtensionsTests
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TextStringExtensions: XCTestCase {
    
    let stringToTest = "Hi12Hello34"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSplitByLenght(){
        let lengthChosen: Int = 2
        let splitStr: Array<String> = stringToTest.splitByLength(lengthChosen)
        var allCorrect: Bool = false
        if(splitStr.count == 6){
            if(splitStr[0] == "Hi" && splitStr[1] == "12" && splitStr[2] == "He" && splitStr[3] == "ll" && splitStr[4] == "o3" && splitStr[5] == "4"){
                allCorrect = true
            }
        }
        XCTAssertTrue(allCorrect, "Split of String by lenght \(lengthChosen.description) did not work correctly")
    }

    func testLocalization(){
        //Testing localization class for a specific file different from generic Strings one
        //Used Bundle(for: type(of: self)) "forcedly" because of test environment
        let italianLocale: String = self.stringToTest.localized(fromFile: "LocalizedTestIT", inBundle: Bundle(for: type(of: self)))
        let englishLocale: String = self.stringToTest.localized(fromFile: "LocalizedTestEN", inBundle: Bundle(for: type(of: self)))
        
        XCTAssertTrue(italianLocale == "Italiano" && englishLocale == "English", "Locale files not being loaded and strings not converting correcly. Something is wrong with testLocalization() method.")
    }
    
    func testReturnStringAtIndex(){
        //return character at index test
        let stringResult: String = self.stringToTest[2]
        XCTAssertTrue(stringResult == String("1"), "Return of subscript as String not being correctly chosen.")
    }
    
    func testReturnCharacterAtIndex(){
        let characterResult: Character = self.stringToTest[2]
        XCTAssertTrue(characterResult == Character("1"), "Return of subscript as Character not being correctly chosen.")
    }
    
    func testRangeStringResult(){
        let rangeStringResult: String = self.stringToTest[2..<4]
        XCTAssertTrue(rangeStringResult == String("12"), "Return of subscript at specific range, as String, not being correctly chosen.")
    }
}
