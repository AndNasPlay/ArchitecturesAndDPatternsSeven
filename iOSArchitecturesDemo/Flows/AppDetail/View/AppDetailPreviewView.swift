//
//  AppDetailPreviewView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailPreviewView: UIView {

	private(set) lazy var previewLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: 17.0)
		label.numberOfLines = 1
		label.text = "Предпросмотр"
		label.textAlignment = .left
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setUI() {
		self.addSubview(previewLable)

		NSLayoutConstraint.activate([

			previewLable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16.0),
			previewLable.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 12.0),
			previewLable.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -12.0),
			previewLable.heightAnchor.constraint(equalToConstant: 20.0)

		])
	}

}
