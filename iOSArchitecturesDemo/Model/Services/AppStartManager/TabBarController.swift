//
//  TabBarController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBackground
		UITabBar.appearance().barTintColor = .systemBackground
		tabBar.tintColor = .label
		setupVCs()

	}

	func setupVCs() {
		viewControllers = [
			createNavController(for: SearchBuilder.build(),
								title: NSLocalizedString("Search app", comment: ""),
								image: UIImage(systemName: "house")!),
			createNavController(for: SearchBuilder.buildSongFinder(),
								title: NSLocalizedString("Search music", comment: ""),
								image: UIImage(systemName: "magnifyingglass")!)
		]
	}


	fileprivate func createNavController(
		for rootViewController: UIViewController,
		title: String,
		image: UIImage) -> UIViewController {
		let navController = UINavigationController(rootViewController: rootViewController)
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		navController.navigationBar.prefersLargeTitles = true
		rootViewController.navigationItem.title = title
		return navController
	}
}

