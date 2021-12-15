//
//  SongDetailInfoView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 15.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailInfoView: UIView {

	private(set) lazy var songImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 10.0
		imageView.layer.masksToBounds = true
		return imageView
	}()

	private(set) lazy var songNameLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: 18.0)
		label.numberOfLines = 2
		return label
	}()

	private(set) lazy var playerNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 16.0)
		label.numberOfLines = 0
		return label
	}()

	private(set) lazy var playButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = 25.0
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	private func setUI() {
		self.addSubview(songImageView)
		self.addSubview(songNameLable)
		self.addSubview(playerNameLabel)
		self.addSubview(playButton)

		NSLayoutConstraint.activate([
			songImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -50.0),
			songImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			songImageView.heightAnchor.constraint(equalToConstant: 100.0),
			songImageView.widthAnchor.constraint(equalToConstant: 100.0),

			songNameLable.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: 12.0),
			songNameLable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			songNameLable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),

			playerNameLabel.topAnchor.constraint(equalTo: songNameLable.bottomAnchor, constant: 6.0),
			playerNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			playerNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),

			playButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			playButton.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 12.0),
			playButton.widthAnchor.constraint(equalToConstant: 50.0),
			playButton.heightAnchor.constraint(equalToConstant: 50.0)
		])

	}
}
