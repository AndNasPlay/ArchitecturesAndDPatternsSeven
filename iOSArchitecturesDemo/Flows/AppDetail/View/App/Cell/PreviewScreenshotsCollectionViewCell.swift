//
//  PreviewScreenshotsCollectionViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class PreviewScreenshotsCollectionViewCell: UICollectionViewCell {

	static let cellIdentifier = "identifierForScreenshotsCollectionViewCell"

	private(set) lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 10.0
		imageView.layer.masksToBounds = true
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupUI() {
		contentView.addSubview(imageView)

		NSLayoutConstraint.activate([
			imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
			imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10.0),
			imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
		])
	}

}
