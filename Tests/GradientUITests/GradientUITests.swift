import XCTest
@testable import GradientUI

final class GradientUITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(GradientUI().text, "Hello, World!")
//		let test = GradientButton()
		NSClassFromString("GradientButton")
//		XCTAssertEqual(NSClassFromString("GradientButton"), !nil)
		
		let exampleButton: GradientButton = {
			let view = GradientButton()
			//		view.backgroundColor = NSColor.white
			view.title = R.text.close.uppercased()
			view.cornerRadius = 16
			view.titleColor = NSColor.white
			//		view.borderColor = NSColor.black
			//		view.borderWidth = 0.5
			view.titleShadowColor = NSColor.darkGray
			view.titleShadowRadius = 2
			view.titleShadowOffset = CGSize(width: 1.0, height: -1.0)
			
			view.shadowColor = NSColor.red.cgColor
			view.shadowRadius = 3
			view.shadowOffset = CGSize(width: 2.0, height: 2.0)
			view.shadowOpacity = 1
			//		let text = NSAttributedString(string: view.title, attributes: [NSAttributedString.Key.kern : 1.1, NSAttributedString.Key.foregroundColor : NSColor.white, NSAttributedString.Key.font : NSFont.boldSystemFont(ofSize: 15)/*, NSAttributedString.Key.strokeColor : NSColor.white, NSAttributedString.Key.strokeWidth : 0.5*/])
			//		view.attributedTitle = text
			//		view.wantsLayer = true
			//		view.layer?.backgroundColor = NSColor.My.lightBlue.cgColor
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
	}

    static var allTests = [
        ("testExample", testExample),
    ]
}
