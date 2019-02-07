//
//  Quote.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/6/19.
//  Copyright © 2019 Brandon Lee. All rights reserved.
//

import Foundation

/// Generated via QuickType
struct Quote: Codable {
	let symbol, companyName, primaryExchange, sector: String
	let calculationPrice: String
	let quoteOpen: Double
	let openTime: Int
	let close: Double
	let closeTime: Int
	let high, low, latestPrice: Double
	let latestSource, latestTime: String
	let latestUpdate, latestVolume: Int
	let iexRealtimePrice: Double
	let iexRealtimeSize, iexLastUpdated: Int
	let delayedPrice: Double
	let delayedPriceTime: Int
	let extendedPrice, extendedChange, extendedChangePercent: Double
	let extendedPriceTime: Int
	let previousClose, change, changePercent, iexMarketPercent: Double
	let iexVolume, avgTotalVolume, iexBidPrice, iexBidSize: Int
	let iexAskPrice, iexAskSize, marketCap: Int
	let peRatio, week52High: Double
	let week52Low: Int
	let ytdChange: Double
	
	enum CodingKeys: String, CodingKey {
		case symbol, companyName, primaryExchange, sector, calculationPrice
		case quoteOpen = "open"
		case openTime, close, closeTime, high, low, latestPrice, latestSource, latestTime, latestUpdate, latestVolume, iexRealtimePrice, iexRealtimeSize, iexLastUpdated, delayedPrice, delayedPriceTime, extendedPrice, extendedChange, extendedChangePercent, extendedPriceTime, previousClose, change, changePercent, iexMarketPercent, iexVolume, avgTotalVolume, iexBidPrice, iexBidSize, iexAskPrice, iexAskSize, marketCap, peRatio, week52High, week52Low, ytdChange
	}
}
