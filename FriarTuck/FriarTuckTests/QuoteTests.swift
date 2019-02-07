//
//  QuoteTests.swift
//  FriarTuckTests
//
//  Created by Lee, Brandon on 2/6/19.
//  Copyright © 2019 Brandon Lee. All rights reserved.
//

import XCTest

class QuoteTests: XCTestCase {
	
	let quoteJSONString = """
							{
							"symbol": "AAPL",
							"companyName": "Apple Inc.",
							"primaryExchange": "Nasdaq Global Select",
							"sector": "Technology",
							"calculationPrice": "close",
							"open": 174.8,
							"openTime": 1549463400637,
							"close": 174.24,
							"closeTime": 1549486800387,
							"high": 175.57,
							"low": 172.853,
							"latestPrice": 174.24,
							"latestSource": "Close",
							"latestTime": "February 6, 2019",
							"latestUpdate": 1549486800387,
							"latestVolume": 28058344,
							"iexRealtimePrice": 174.28,
							"iexRealtimeSize": 100,
							"iexLastUpdated": 1549486799837,
							"delayedPrice": 174.24,
							"delayedPriceTime": 1549486800387,
							"extendedPrice": 174.17,
							"extendedChange": -0.07,
							"extendedChangePercent": -0.0004,
							"extendedPriceTime": 1549490396784,
							"previousClose": 174.18,
							"change": 0.06,
							"changePercent": 0.00034,
							"iexMarketPercent": 0.02379,
							"iexVolume": 667508,
							"avgTotalVolume": 41365578,
							"iexBidPrice": 0,
							"iexBidSize": 0,
							"iexAskPrice": 0,
							"iexAskSize": 0,
							"marketCap": 821590387200,
							"peRatio": 14.68,
							"week52High": 233.47,
							"week52Low": 142,
							"ytdChange": 0.10368346504559284
							}
							"""
	
	func testDecodeQuote() {
		
		guard let jsonData = quoteJSONString.data(using: .utf8),
			let quoteObject = try? JSONDecoder().decode(Quote.self, from: jsonData) else {
				return XCTFail("Quote Model not decodable")
		}
		
		XCTAssertEqual(quoteObject.symbol, "AAPL")
		XCTAssertEqual(quoteObject.companyName, "Apple Inc.")
		XCTAssertEqual(quoteObject.marketCap, 821590387200)
		XCTAssertEqual(quoteObject.iexRealtimePrice, 174.28)
	}
}
