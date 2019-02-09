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
	
	fileprivate let urlScheme = "https"
	fileprivate let urlHost	  = "api.iextrading.com"
	fileprivate let defaultSession = URLSession(configuration: .default)
	
	fileprivate var dataTask: URLSessionDataTask?
	
	
	public func getStockQuote(_ stockSymbol: String, completion: @escaping QuoteResult) {
		
		let quotePath = "/1.0/stock/\(stockSymbol)/quote/\(stockSymbol)"
		var urlComponents = URLComponents()
		
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
			
			completion(decodedQuote)
		}
	}
		
	// MARK: - UTILITIES
	
	public func baseNetworkCall(url: URL, completion: @escaping NetworkResult) {
		
		dataTask?.cancel()
		
		dataTask = defaultSession.dataTask(with: url) { data, response, error in
			defer { self.dataTask = nil }
			
			if let error = error {
				print(error)
			} else if let data = data, let response = response as? HTTPURLResponse {
				DispatchQueue.main.async {
					completion(response.statusCode, data)
				}
			}
		}
		
		dataTask?.resume()
	}
	
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

