//
//  StockTableController.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/9/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

class StockTableController: UITableViewController {
	
	var stockData: [Quote] = []
	let iexService = IEXService()
		
	override func viewDidLoad() {
		super.viewDidLoad()

		submitQueries()
		tableView.register(StockCell.self, forCellReuseIdentifier: stockCellReuseIdentifier)
	}
	
	func submitQueries() {
		for stock in ["AAPL", "AMZN", "NKE"] {
			iexService.getStockQuote(stock) { quote in
				self.stockData.append(quote)
				self.tableView.reloadData()
			}
		}
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return stockData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: stockCellReuseIdentifier, for: indexPath) as? StockCell {
			cell.symbolLabel.text = stockData[indexPath.row].symbol
			if let latestPrice = stockData[indexPath.row].latestPrice {
				cell.priceLabel.text = "$\(String(describing: latestPrice))"
			}
			cell.accessibilityIdentifier = "cell_\(indexPath.row)"
			
			return cell
		}
		
		return UITableViewCell()
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	} 
}
