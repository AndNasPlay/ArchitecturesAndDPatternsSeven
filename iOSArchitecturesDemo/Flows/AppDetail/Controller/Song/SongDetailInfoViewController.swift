//
//  SongDetailInfoViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 15.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailInfoViewController: UIViewController {

	private let song: ITunesSong

	private var imageDictionary = PictureStorage.shared.songImgDictionary

	private let imageDownLoader = ImageDownloader()

	private var songDetailHeaderView: SongDetailInfoView {
		return self.view as! SongDetailInfoView
	}

	init(song: ITunesSong) {
		self.song = song
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = SongDetailInfoView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		fillData()
	}

	private func fillData() {
		downloadImage()
		songDetailHeaderView.playerNameLabel.text = song.artistName
		songDetailHeaderView.songNameLable.text = song.trackName
	}

	private func downloadImage() {
		guard let url = self.song.artwork else { return }

		if imageDictionary[url] != nil {
			DispatchQueue.main.async {
				self.songDetailHeaderView.songImageView.image = self.imageDictionary[url]
			}
		} else {
			imageDownLoader.getImage(fromUrl: url) { [weak self] (image, _) in
				guard let self = self else { return }
				PictureStorage.shared.songImgDictionary[url] = image
				DispatchQueue.main.async {
					self.songDetailHeaderView.songImageView.image = image
				}
			}
		}
	}
}