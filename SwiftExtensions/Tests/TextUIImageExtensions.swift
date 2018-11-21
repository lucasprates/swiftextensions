//
//  TextUIImageExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TextUIImageExtensions: XCTestCase {
    
    var imageToTest: UIImage?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.imageToTest = UIImage(named: "square", in: Bundle(for: type(of: self)), compatibleWith: nil)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetPixelColor() {
        //Test the getter of the color of the pixel at desired point
        let firstPixelOfImage: UIColor? = self.imageToTest?.getPixelColor(pos: CGPoint(x: 0, y: 0))
        let realFirstPixelOfImage: UIColor = UIColor(red: 253.0/255.0, green: 232.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        XCTAssertTrue((firstPixelOfImage?.cgColor == realFirstPixelOfImage.cgColor), "First Pixel of Image named \"Square\" should be equal to representation described at UIColor's var named \"realFirstPixelOfImage\"")
        
        let wrongFirstPixelOfImage: UIColor = UIColor.darkGray
        XCTAssertFalse((firstPixelOfImage?.cgColor == wrongFirstPixelOfImage.cgColor), "First Pixel of Image named \"Square\" should NOT be equal to a wrong random representation of UIColor with var name \"wrongFirstPixelOfImage\"")
    }
    
    func testRoundedImage(){
        //Test the appliance of "roundness" to a picutre of other format
        //Get color of first image pixel (should be a brown color)
        let previousFirstPixelColorOfImage: UIColor? = self.imageToTest?.getPixelColor(pos: CGPoint(x: 0, y: 0))
        //round the image corners
        let roundedImage: UIImage? = self.imageToTest?.roundedImage
        //get color of first pixel of newly refreshed rounded image (should be a 0,0,0 RGB pixel)
        let newFirstPixelColorOfImage: UIColor? = roundedImage?.getPixelColor(pos: CGPoint(x: 0, y: 0))
        
        //check if it rounded the image
        XCTAssertFalse((previousFirstPixelColorOfImage?.cgColor == newFirstPixelColorOfImage?.cgColor), "Round action of UIImage not working correctly")
        XCTAssertTrue((newFirstPixelColorOfImage?.cgColor == (UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor)), "Round action of UIImage not working correctly")
    }
    
    func testResizeImageWidth(){
        //Resizes an image on its largest size by a given size, respecting its previous aspect ratio
        let previousImageWidth = self.imageToTest?.size.width
        let newImageSize: CGSize = CGSize(width: CGFloat(50), height: self.imageToTest?.size.height ?? 0)
        let resizedImage: UIImage? = self.imageToTest?.resizeImageWidth(newSize: newImageSize)
        let newImageWidth: CGFloat = resizedImage?.size.width ?? 0
        
        XCTAssertFalse((previousImageWidth == newImageWidth), "Image size should have been changed to \(newImageSize.width.description) (instead of \(newImageWidth.description) and should NOT been the same")
    }

}
