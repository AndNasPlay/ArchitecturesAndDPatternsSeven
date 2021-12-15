//
//  AppDetailVersionHistoryViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionHistoryViewController: UIViewController {

	private let app: ITunesApp

	private var appDetailVersionHistoryView: AppDetailVersionHistoryView {
		return self.view as! AppDetailVersionHistoryView
	}

	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = AppDetailVersionHistoryView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		fillData()
	}

	private func fillData() {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"

		let date = dateFormatter.date(from: app.currentVersionReleaseDate ?? "2021-12-07T12:17:21Z")

		let relativeDtf = RelativeDateTimeFormatter()
		let christmas2019 = Date(timeIntervalSince1970: 1577232000.0)
		let now = Date()

		appDetailVersionHistoryView.numberOfVersionLable.text = "Версия \(app.version ?? "1.0")"
		appDetailVersionHistoryView.updateDateLable.text = 		relativeDtf.localizedString(for: date ?? christmas2019, relativeTo: now)
		appDetailVersionHistoryView.updateTitleLable.text = app.releaseNotes
	}
}
