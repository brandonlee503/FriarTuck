//
//  FriarTuckUITests.swift
//  FriarTuckUITests
//
//  Created by Lee, Brandon on 2/6/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import XCTest

class FriarTuckUITests: XCTestCase {
	
	var app: XCUIApplication!

    override func setUp() {
		super.setUp()
		
        continueAfterFailure = false
        app = XCUIApplication()
		app.launch()
    }

    override func tearDown() {
		app = nil
		super.tearDown()
    }
	
	func testStockTableLabels() {
		let cell0 = app.cells["cell_0"]
		let cell1 = app.cells["cell_1"]
		let cell2 = app.cells["cell_2"]
		
		XCTAssertTrue(cell0.exists)
		XCTAssertTrue(cell1.exists)
		XCTAssertTrue(cell2.exists)
		
		// Check cell labels
		XCTAssertTrue(cell0.staticTexts["symbol_label"].exists)
		XCTAssertTrue(cell1.staticTexts["symbol_label"].exists)
		XCTAssertTrue(cell2.staticTexts["symbol_label"].exists)
		
		XCTAssertTrue(cell0.staticTexts["price_label"].exists)
		XCTAssertTrue(cell1.staticTexts["price_label"].exists)
		XCTAssertTrue(cell2.staticTexts["price_label"].exists)
	}
}
