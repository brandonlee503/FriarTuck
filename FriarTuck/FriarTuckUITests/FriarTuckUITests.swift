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
	
	/// Checks first 3 cells (assumes there's at least 3 cells)
	func testStockTableUX() {
		let cell0 = app.cells["cell_0"]
		let cell1 = app.cells["cell_1"]
		let cell2 = app.cells["cell_2"]
		
		XCTAssertTrue(cell0.exists)
		XCTAssertTrue(cell1.exists)
		XCTAssertTrue(cell2.exists)
		
		XCTAssertTrue(cell0.staticTexts["left_label"].exists)
		XCTAssertTrue(cell1.staticTexts["left_label"].exists)
		XCTAssertTrue(cell2.staticTexts["left_label"].exists)
		
		XCTAssertTrue(cell0.staticTexts["right_label"].exists)
		XCTAssertTrue(cell1.staticTexts["right_label"].exists)
		XCTAssertTrue(cell2.staticTexts["right_label"].exists)
	}
	
	func testDetailControllerNavigation() {
		let firstCell = app.cells.firstMatch
		firstCell.tap()
		
		XCTAssertTrue(app.navigationBars.buttons["Friar Tuck"].exists)
	}
	
	/// Checks StockDetailController's UX for correctly displaying all labels
	func testDetailControllerUX() {
		let firstCell = app.cells.firstMatch
		firstCell.tap()
		
		let titleCell = app.cells["detail_cell_0"]
		let detailCell1 = app.cells["detail_cell_1"]
		let detailCell2 = app.cells["detail_cell_2"]
		let detailCell3 = app.cells["detail_cell_3"]
		let detailCell4 = app.cells["detail_cell_4"]
		
		XCTAssertTrue(titleCell.exists)
		XCTAssertTrue(detailCell1.exists)
		XCTAssertTrue(detailCell2.exists)
		XCTAssertTrue(detailCell3.exists)
		XCTAssertTrue(detailCell4.exists)
		
		XCTAssertTrue(titleCell.staticTexts["left_label"].exists)
		XCTAssertTrue(titleCell.staticTexts["right_label"].label.count == 0) // No corresponding details with title
		
		XCTAssertEqual(detailCell1.staticTexts["left_label"].label, "Latest")
		XCTAssertTrue(detailCell1.staticTexts["right_label"].exists)
		
		XCTAssertEqual(detailCell2.staticTexts["left_label"].label, "High")
		XCTAssertTrue(detailCell2.staticTexts["right_label"].exists)
		
		XCTAssertEqual(detailCell3.staticTexts["left_label"].label, "Low")
		XCTAssertTrue(detailCell3.staticTexts["right_label"].exists)
		
		XCTAssertEqual(detailCell4.staticTexts["left_label"].label, "P/E Ratio")
		XCTAssertTrue(detailCell4.staticTexts["right_label"].exists)
	}
}
