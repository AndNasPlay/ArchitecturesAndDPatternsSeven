//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {

	public var app: ITunesApp

	lazy var headerViewController = AppDetailHeaderViewController(app: app)

	lazy var headerRatingViewController = AppDetailRatingViewController(app: app)

	lazy var headerHistoryViewController = AppDetailVersionHistoryViewController(app: app)

	lazy var previewViewController = AppDetailPreviewViewController(app: app)

	private let imageDownloader = ImageDownloader()

	private var appDetailView: AppDetailView {
		return self.view as! AppDetailView
	}

	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	override func loadView() {
		super.loadView()
		self.view = AppDetailView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}

	// MARK: - Private

	private func configureUI() {
		view.backgroundColor = .white
		self.navigationController?.navigationBar.tintColor = UIColor.white;
		self.navigationItem.largeTitleDisplayMode = .never

		addChildViewController()
		addDescriptionViewController()
		addAppDetailVersionHistoryViewController()
		addAppDetailPreviewViewController()

	}

	private func addChildViewController() {
		self.addChild(headerViewController)
		self.view.addSubview(headerViewController.view)

		self.headerViewController.didMove(toParent: self)

		headerViewController.view.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			headerViewController.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
			headerViewController.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
			headerViewController.view.heightAnchor.constraint(equalToConstant: 150.0)
		])
	}

	private func addDescriptionViewController() {
		self.addChild(headerRatingViewController)
		self.view.addSubview(headerRatingViewController.view)

		headerRatingViewController.view.translatesAutoresizingMaskIntoConstraints = false
		self.headerRatingViewController.didMove(toParent: self)

		NSLayoutConstraint.activate([
			headerRatingViewController.view.topAnchor.constraint(equalTo: self.view.subviews[0].bottomAnchor),
			headerRatingViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			headerRatingViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			headerRatingViewController.view.heightAnchor.constraint(equalToConstant: 50.0)
		])

	}

	private func addAppDetailVersionHistoryViewController() {
		self.addChild(headerHistoryViewController)
		self.view.addSubview(headerHistoryViewController.view)

		headerHistoryViewController.view.translatesAutoresizingMaskIntoConstraints = false
		self.headerHistoryViewController.didMove(toParent: self)

		NSLayoutConstraint.activate([
			headerHistoryViewController.view.topAnchor.constraint(equalTo: self.view.subviews[1].bottomAnchor, constant: 12.0),
			headerHistoryViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			headerHistoryViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			headerHistoryViewController.view.heightAnchor.constraint(equalToConstant: 150.0)
		])

	}

	private func addAppDetailPreviewViewController() {
		self.addChild(previewViewController)
		self.view.addSubview(previewViewController.view)

		previewViewController.view.translatesAutoresizingMaskIntoConstraints = false
		self.previewViewController.didMove(toParent: self)

		NSLayoutConstraint.activate([
			previewViewController.view.topAnchor.constraint(equalTo: self.view.subviews[2].bottomAnchor, constant: 12.0),
			previewViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			previewViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			previewViewController.view.heightAnchor.constraint(equalToConstant: 340.0)
		])
	}
}
