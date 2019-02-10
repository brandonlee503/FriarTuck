//
//  StockDetailController.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/10/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

class StockDetailController: UITableViewController {
	
	// MARK: - PROPERTIES
	
	var quote: Quote?

	// MARK: - VIEW LIFECYCLE
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = quote?.symbol
		tableView.register(GenericStockCell.self, forCellReuseIdentifier: stockCellReuseIdentifier)
		tableView.allowsSelection = false
		tableView.tableFooterView = UIView()
    }

    // MARK: - TABLE VIEW DATA SOURCE

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 75
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: stockCellReuseIdentifier, for: indexPath) as? GenericStockCell {
			switch indexPath.row {
			case 0:
				cell.leftLabel.text = quote?.companyName
			case 1:
				if let latestPrice = quote?.latestPrice {
					cell.leftLabel.text = "Latest"
					cell.rightLabel.text = "$\(String(describing: latestPrice))"
				}
			case 2:
				if let highPrice = quote?.high {
					cell.leftLabel.text = "High"
					cell.rightLabel.text = "$\(String(describing: highPrice))"
				}
			case 3:
				if let lowPrice = quote?.low {
					cell.leftLabel.text = "Low"
					cell.rightLabel.text = "$\(String(describing: lowPrice))"
				}
			case 4:
				if let peRatio = quote?.peRatio {
					cell.leftLabel.text = "P/E Ratio"
					cell.rightLabel.text = "\(String(describing: peRatio))"
				}
			default:
				return UITableViewCell()
			}
			
			cell.accessibilityIdentifier = "detail_cell_\(indexPath.row)"
			return cell
		}
		
        return UITableViewCell()
    }
}
