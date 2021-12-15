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

	lazy var songInfoViewController = SongDetailInfoViewController(song: song)

	private let imageDownloader = ImageDownloader()

	private var appDetailView: SongDetailView {
		return self.view as! SongDetailView
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
		self.view = SongDetailView()
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

	}

	private func addChildViewController() {
		self.addChild(songInfoViewController)
		self.view.addSubview(songInfoViewController.view)

		self.songInfoViewController.didMove(toParent: self)

		songInfoViewController.view.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			songInfoViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			songInfoViewController.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
			songInfoViewController.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
			songInfoViewController.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
