//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {

	public var song: ITunesSong

	private let imageDownloader = ImageDownloader()

	private var appDetailView: AppDetailView {
		return self.view as! AppDetailView
	}

	init(song: ITunesSong) {
		self.song = song
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

	}
}
