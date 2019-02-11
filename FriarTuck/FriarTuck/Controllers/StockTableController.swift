//
//  StockTableController.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/9/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

class StockTableController: UITableViewController {
	
	// MARK: - PROPERTIES
	
	var stocks: [String] = []
	var stockData: [Quote] = []
	let iexService = IEXService()
	
	// MARK: - VIEW LIFECYCLE
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		submitQueries()
		tableView.register(GenericStockCell.self, forCellReuseIdentifier: stockCellReuseIdentifier)
		self.title = "Friar Tuck"
		tableView.tableFooterView = UIView()
	}
	
	// MARK: - UTILITIES
	
	/// Grabs root stocks set in AppDelegate and fetch
	func submitQueries() {
		for stock in stocks {
			iexService.getStockQuote(stock) { quote in
				self.stockData.append(quote)
				self.tableView.reloadData()
			}
		}
	}
	
	// MARK: - TABLE VIEW DATA SOURCE
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return stockData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: stockCellReuseIdentifier, for: indexPath) as? GenericStockCell {
			cell.leftLabel.text = stockData[indexPath.row].symbol
			if let latestPrice = stockData[indexPath.row].latestPrice {
				cell.rightLabel.text = "$\(String(describing: latestPrice))"
			}
			cell.accessibilityIdentifier = "cell_\(indexPath.row)"
			
			return cell
		}
		
		return UITableViewCell()
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	// MARK: - NAVIGATION
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailVC = StockDetailController()
		detailVC.quote = stockData[indexPath.row]
		navigationController?.pushViewController(detailVC, animated: true)
	}
}
