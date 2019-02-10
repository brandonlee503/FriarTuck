//
//  AppDelegate.swift
//  FriarTuck
//
//  Created by Lee, Brandon on 2/6/19.
//  Copyright © 2019 Lee, Brandon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		let navigationController = UINavigationController(rootViewController: StockTableController())
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		return true
	}
}

