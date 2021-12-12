//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {

	private let app: ITunesApp

	private var imageDictionary = PictureStorage.shared.pictureDictionary

	private let imageDownLoader = ImageDownloader()

	private var appDetailHeaderView: AppDetailHeaderView {
		return self.view as! AppDetailHeaderView
	}

	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = AppDetailHeaderView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		fillData()
	}

	private func fillData() {
		downloadImage()
		appDetailHeaderView.titleLabel.text = app.appName
		appDetailHeaderView.subtitleLabel.text = app.company
	}

	private func downloadImage() {
		guard let url = self.app.iconUrl else { return }

		if imageDictionary[url] != nil {
			DispatchQueue.main.async {
				self.appDetailHeaderView.imageView.image = self.imageDictionary[url]
			}
		} else {
			imageDownLoader.getImage(fromUrl: url) { [weak self] (image, _) in
				guard let self = self else { return }
				PictureStorage.shared.pictureDictionary[url] = image
				DispatchQueue.main.async {
					self.appDetailHeaderView.imageView.image = image
				}
			}
		}
	}
}
