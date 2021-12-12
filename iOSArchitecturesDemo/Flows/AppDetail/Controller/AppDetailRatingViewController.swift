//
//  AppDetailRatingViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 07.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailRatingViewController: UIViewController {

	private let app: ITunesApp

	private var appDetailRatingView: AppDetailRatingView {
		return self.view as! AppDetailRatingView
	}

	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = AppDetailRatingView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		fillData()
	}

	private func fillData() {

		appDetailRatingView.ratingView.rating = Double(app.averageRating ?? 0)
		appDetailRatingView.ratingLabel.text = String(format:"%.1f", app.averageRating!)
		appDetailRatingView.subtitleRatingLabel.text = "\((app.userRatingCount ?? 0) / 1000) тыс. оценок"
		appDetailRatingView.ageLabel.text = app.contentAdvisoryRating?.rawValue
		appDetailRatingView.subtitleNumberInTableLabel.text = app.genres?.first 
	}
}
