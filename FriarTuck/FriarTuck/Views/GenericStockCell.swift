//
//  GenericStockCell.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/9/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

let stockCellReuseIdentifier = "GenericStockCell"

class GenericStockCell: UITableViewCell {
	
	// MARK: - PROPERTIES
	
	var leftLabel = UILabel()
	var rightLabel = UILabel()
	
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
		leftLabel.font = UIFont.systemFont(ofSize: 36)
		leftLabel.textColor = .black
		leftLabel.lineBreakMode = .byWordWrapping
		leftLabel.accessibilityIdentifier = "left_label"
		addSubview(leftLabel)
		
		rightLabel.font = UIFont.systemFont(ofSize: 24)
		rightLabel.textColor = .black
		rightLabel.lineBreakMode = .byWordWrapping
		rightLabel.accessibilityIdentifier = "right_label"
		addSubview(rightLabel)
	}
	
	func setupConstraints() {
		leftLabel.translatesAutoresizingMaskIntoConstraints = false
		rightLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			leftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			leftLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		
		NSLayoutConstraint.activate([			
			rightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}	
}
