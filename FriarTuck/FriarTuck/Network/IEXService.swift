//
//  IEXService.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/7/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import Foundation

typealias StatusCode 	= Int
typealias NetworkResult = (StatusCode, Data?) -> ()
typealias QuoteResult 	= (Quote) -> ()

class IEXService {
	
	// MARK: - PROPERTIES
	
	fileprivate let urlScheme = "https"
	fileprivate let urlHost	  = "api.iextrading.com"
	
	// MARK: - NETWORK
	
	/// Fetches a stock quote form IEX Trading
	///
	/// - Parameters:
	///   - stockSymbol: A valid stock symbol e.g. — AAPL
	///   - completion: Returns a closure with Quote object
	public func getStockQuote(_ stockSymbol: String, completion: @escaping QuoteResult) {
		let quotePath = "/1.0/stock/\(stockSymbol.lowercased())/quote/\(stockSymbol)"

		var urlComponents 		= URLComponents()
		urlComponents.scheme 	= urlScheme
		urlComponents.host		= urlHost
		urlComponents.path 		= quotePath
		
		guard let url = urlComponents.url else {
			return assertionFailure("Cannot build URL!")
		}
		
		baseNetworkCall(url: url) { statusCode, data in
			guard let data = data, let decodedQuote = self.decodeQuote(data) else {
				return assertionFailure("Cannot decode quote data!")
			}
			DispatchQueue.main.async {
				completion(decodedQuote)
			}
		}
	}
		
	// MARK: - UTILITIES
	
	/// Base-level network call.
	///
	/// - Parameters:
	///   - url: URL to fire off dataTask on
	///   - completion: Returns a closure with StatusCode and Data
	public func baseNetworkCall(url: URL, completion: @escaping NetworkResult) {
		let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in			
			if let error = error {
				print(error)
			} else if let data = data, let response = response as? HTTPURLResponse {
				DispatchQueue.main.async {
					completion(response.statusCode, data)
				}
			}
		}
		
		dataTask.resume()
	}
	
	/// Attempts to decode Data into Quote model
	///
	/// - Parameter data: Data from network call
	/// - Returns: Quote if decoded properly
	private func decodeQuote(_ data: Data) -> Quote? {
		
		do {
			let quote = try JSONDecoder().decode(Quote.self, from: data)
			return quote
		} catch let error {
			assertionFailure(error.localizedDescription)
		}
		
		return nil
	}
}

