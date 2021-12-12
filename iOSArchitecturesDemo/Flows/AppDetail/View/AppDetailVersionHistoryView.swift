//
//  AppDetailVersionHistoryView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionHistoryView: UIView {

	private let titleSize: CGFloat = 15.0
	private let subTitleSize: CGFloat = 12.0

	private(set) lazy var aboutNewVersionLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: 17.0)
		label.numberOfLines = 1
		label.text = "Что нового"
		label.textAlignment = .left
		return label
	}()

	private(set) lazy var historyVersion: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("История версий", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: titleSize)
		button.backgroundColor = .white
		return button
	}()

	private(set) lazy var numberOfVersionLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.boldSystemFont(ofSize: subTitleSize)
		label.numberOfLines = 1
		label.text = "Версия"
		label.textAlignment = .left
		return label
	}()

	private(set) lazy var updateDateLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.boldSystemFont(ofSize: subTitleSize)
		label.numberOfLines = 1
		label.text = "Сколько дней назад"
		label.textAlignment = .right
		return label
	}()

	private(set) lazy var updateTitleLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.italicSystemFont(ofSize: 14.0)
		label.numberOfLines = 0
		label.text = "описание"
		return label
	}()

	private(set) lazy var firstStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.axis = .horizontal
		return stack
	}()

	private(set) lazy var secondStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.axis = .horizontal
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
		firstStackView.addArrangedSubview(aboutNewVersionLable)
		firstStackView.addArrangedSubview(historyVersion)

		secondStackView.addArrangedSubview(numberOfVersionLable)
		secondStackView.addArrangedSubview(updateDateLable)

	}

	private func setUI() {
		setStackView()
		self.addSubview(firstStackView)
		self.addSubview(secondStackView)
		self.addSubview(updateTitleLable)

		NSLayoutConstraint.activate([

			firstStackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			firstStackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
			firstStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),

			secondStackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			secondStackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
			secondStackView.topAnchor.constraint(equalTo: self.firstStackView.bottomAnchor, constant: 12.0),

			updateTitleLable.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			updateTitleLable.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
			updateTitleLable.topAnchor.constraint(equalTo: self.secondStackView.bottomAnchor, constant: 12.0),
			updateTitleLable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
}
