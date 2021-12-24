//
//  SongDetailInfoView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 15.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongDetailInfoViewDelegate: AnyObject {
	func playButtonDidTap()
	func stopButtonDidTap()
	func pauseButtonDidTap()
}

class SongDetailInfoView: UIView {

	weak var delegate: SongDetailInfoViewDelegate?

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

	private(set) lazy var progressView: UIProgressView = {
		let progressView = UIProgressView()
		progressView.translatesAutoresizingMaskIntoConstraints = false
		progressView.progressTintColor = .black
		return progressView
	}()

	private(set) lazy var playButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "playButton"), for: .normal)
		button.layer.cornerRadius = 40.0
		return button
	}()

	private(set) lazy var stopButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "stopButton"), for: .normal)
		button.layer.cornerRadius = 40.0
		return button
	}()

	private(set) lazy var pauseButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "pauseButton"), for: .normal)
		button.layer.cornerRadius = 40.0
		return button
	}()

	private(set) lazy var buttonStackView: UIStackView = {
		let stack = UIStackView()
		stack.alignment = .center
		stack.spacing = 30.0
		stack.axis = .horizontal
		stack.distribution = .fillEqually
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
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
		self.addSubview(buttonStackView)
		self.addSubview(progressView)

		self.playButton.addTarget(self, action: #selector(handlePlayButtonTouchUpInseide), for: .touchUpInside)
		self.stopButton.addTarget(self, action: #selector(handleStopButtonTouchUpInseide), for: .touchUpInside)
		self.pauseButton.addTarget(self, action: #selector(handlePauseButtonTouchUpInseide), for: .touchUpInside)

		self.buttonStackView.addArrangedSubview(pauseButton)
		self.buttonStackView.addArrangedSubview(playButton)
		self.buttonStackView.addArrangedSubview(stopButton)

		NSLayoutConstraint.activate([
			songImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60.0),
			songImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			songImageView.heightAnchor.constraint(equalToConstant: 100.0),
			songImageView.widthAnchor.constraint(equalToConstant: 100.0),

			songNameLable.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: 12.0),
			songNameLable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			songNameLable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),

			playerNameLabel.topAnchor.constraint(equalTo: songNameLable.bottomAnchor, constant: 6.0),
			playerNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			playerNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),

			progressView.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 30.0),
			progressView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			progressView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),

			buttonStackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 30.0),
			buttonStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
			buttonStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),
			buttonStackView.heightAnchor.constraint(equalToConstant: 80.0)
		])
	}

	@objc func handlePlayButtonTouchUpInseide() {
		delegate?.playButtonDidTap()
		playButton.backgroundColor = .lightGray
	}

	@objc func handleStopButtonTouchUpInseide() {
		delegate?.stopButtonDidTap()
		playButton.backgroundColor = .none
	}

	@objc func handlePauseButtonTouchUpInseide() {
		delegate?.pauseButtonDidTap()
		playButton.backgroundColor = .none
	}
}
