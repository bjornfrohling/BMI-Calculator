//
//  BMI_CalculatorTests.swift
//  BMI-CalculatorTests
//
//  Created by Björn Fröhling on 02/07/16.
//  Copyright © 2016 Fröhling. All rights reserved.
//

import XCTest
import UIKit
@testable import BMI_Calculator

// https://www.appcoda.com/unit-testing-swift/
// https://www.natashatherobot.com/ios-testing-view-controllers-swift/

class BMI_CalculatorTests: XCTestCase {

	var viewController: ViewController!

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.

		let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.classForCoder))
		let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
		viewController = navigationController.topViewController as! ViewController

		UIApplication.sharedApplication().keyWindow!.rootViewController = viewController

		// Test and Load the View at the Same Time!
		XCTAssertNotNil(navigationController.view)
		XCTAssertNotNil(viewController.view)
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		viewController = nil

		super.tearDown()
	}

	func testBmiWith0() {
		let result = viewController.calculateBmi(0, kgValue: 0)
		XCTAssert(result == 0, "Wrong BMI ! Should be 0")
	}

	func testBmiWithValues() {
		let result = viewController.calculateBmi(140, kgValue: 30)
		XCTAssert(result == 15, "Wrong BMI ! 140 cm and 30 kg = BMI 15")
	}

}
