//
//  AppDetailPreviewCollectionViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailPreviewCollectionViewCell: UICollectionViewCell {

	static let cellIdentifier = "identifier"

	private(set) lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
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
		addSubview(imageView)

		NSLayoutConstraint.activate([
			imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 696.0),
			imageView.widthAnchor.constraint(equalToConstant: 392.0)
		])
	}

}
