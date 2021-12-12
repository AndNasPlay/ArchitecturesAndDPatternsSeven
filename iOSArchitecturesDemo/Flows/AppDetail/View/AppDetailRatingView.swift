//
//  AppDetailRatingView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 07.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailRatingView: UIView {

	private let titleSize: CGFloat = 17.0

	private(set) lazy var ratingView: CosmosView = {
		let imageView = CosmosView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.settings.updateOnTouch = false
		imageView.settings.starSize = 20
		imageView.settings.starMargin = 5
		imageView.settings.fillMode = .precise
		return imageView
	}()

	private(set) lazy var ratingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: titleSize)
		label.numberOfLines = 0
		return label
	}()

	private(set) lazy var subtitleRatingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 12.0)
		label.numberOfLines = 0
		return label
	}()

	private(set) lazy var numberInTableLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: titleSize)
		label.numberOfLines = 0
		label.text = "#64"
		return label
	}()

	private(set) lazy var subtitleNumberInTableLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.boldSystemFont(ofSize: 12.0)
		label.textAlignment = .center
		label.numberOfLines = 1
		return label
	}()

	private(set) lazy var ageLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: titleSize)
		label.numberOfLines = 0
		label.text = "4+"
		return label
	}()

	private(set) lazy var subtitleAgeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.boldSystemFont(ofSize: 12.0)
		label.numberOfLines = 0
		label.text = "Возраст"
		return label
	}()

	private(set) lazy var trendStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .center
		stack.axis = .vertical
		return stack
	}()

	private(set) lazy var ageStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .center
		stack.axis = .vertical
		return stack
	}()

	private(set) lazy var trendAndAgeStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.axis = .horizontal
		return stack
	}()

	private(set) lazy var ratingStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .center
		stack.axis = .horizontal
		return stack
	}()

	private(set) lazy var allRatingStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.axis = .vertical
		return stack
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setStackView() {
		trendStackView.addArrangedSubview(numberInTableLabel)
		trendStackView.addArrangedSubview(subtitleNumberInTableLabel)

		ageStackView.addArrangedSubview(ageLabel)
		ageStackView.addArrangedSubview(subtitleAgeLabel)

		trendAndAgeStackView.addArrangedSubview(trendStackView)
		trendAndAgeStackView.addArrangedSubview(ageStackView)

		ratingStackView.addArrangedSubview(ratingLabel)
		ratingStackView.addArrangedSubview(ratingView)

		allRatingStackView.addArrangedSubview(ratingStackView)
		allRatingStackView.addArrangedSubview(subtitleRatingLabel)
	}



	private func setUI() {
		setStackView()
		self.addSubview(allRatingStackView)
		self.addSubview(trendAndAgeStackView)

		NSLayoutConstraint.activate([

			ratingLabel.widthAnchor.constraint(equalTo: allRatingStackView.widthAnchor, multiplier: 0.2),

			trendStackView.widthAnchor.constraint(equalTo: trendAndAgeStackView.widthAnchor, multiplier: 0.7),
			ageStackView.widthAnchor.constraint(equalTo: trendAndAgeStackView.widthAnchor, multiplier: 0.3),

			allRatingStackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			allRatingStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
			allRatingStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 12.0),
			allRatingStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),

			trendAndAgeStackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
			trendAndAgeStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
			trendAndAgeStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 12.0),
			trendAndAgeStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
		])
	}
}
