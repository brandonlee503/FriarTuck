//
//  IEXServiceTests.swift
//  FriarTuckTests
//
//  Created by Lee, Brandon on 2/6/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import XCTest

class IEXServiceTests: XCTestCase {
	
	var iexService: IEXService?

    override func setUp() {
		super.setUp()
		iexService = IEXService()
    }

    override func tearDown() {
		iexService = nil
		super.tearDown()
    }
	
	func testConnectWithIEXService() {
		guard let url = URL(string: "https://api.iextrading.com/1.0/stock/aapl/quote/AAPL") 
			else { return XCTFail("Cannot build URL") }
		
		iexService?.baseNetworkCall(url: url) { statusCode, data in
			XCTAssertEqual(statusCode, 200)
			XCTAssertNotNil(data)
		}
	}
	
	func testDeserializeServicePayloadToModel() {
		
		iexService?.getStockQuote("NKE") { quote in
			XCTAssertNotNil(quote)
			XCTAssertEqual(quote.companyName, "Nike Inc.")
			XCTAssertNotNil(quote.symbol, "NKE")
		}
	}
}
