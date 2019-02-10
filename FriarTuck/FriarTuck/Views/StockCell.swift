//
//  StockCell.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/9/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

let stockCellReuseIdentifier = "StockCell"

class StockCell: UITableViewCell {
	
	// MARK: - PROPERTIES
	
	var symbolLabel = UILabel()
	var priceLabel = UILabel()
	
	// MARK: - INITIALIZATION
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setup()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP
	
	func setup() {
		symbolLabel.font = UIFont.systemFont(ofSize: 36)
		symbolLabel.textColor = .black
		symbolLabel.lineBreakMode = .byWordWrapping
//		symbolLabel.accessibilityIdentifier = ""
		addSubview(symbolLabel)
		
		priceLabel.font = UIFont.systemFont(ofSize: 24)
		priceLabel.textColor = .black
		priceLabel.lineBreakMode = .byWordWrapping
		addSubview(priceLabel)
	}
	
	func setupConstraints() {
		symbolLabel.translatesAutoresizingMaskIntoConstraints = false
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			symbolLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			symbolLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
			])
		
		NSLayoutConstraint.activate([			
			priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
			])
		
		
	}
	
	
	//    override func setSelected(_ selected: Bool, animated: Bool) {
	//        super.setSelected(selected, animated: animated)
	//
	//        // Configure the view for the selected state
	//    }
	
}
