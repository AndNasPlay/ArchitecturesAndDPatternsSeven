//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 15.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {

	// MARK: - Subviews

	private(set) lazy var artworkImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 5.0
		imageView.layer.masksToBounds = true
		imageView.image = UIImage(named: "note")
		return imageView
	}()

	private(set) lazy var artistNameLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 16.0)
		return label
	}()

	private(set) lazy var trackNameLable: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .gray
		label.font = UIFont.systemFont(ofSize: 13.0)
		return label
	}()

	private(set) lazy var collectionNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 12.0)
		return label
	}()

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.configureUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.configureUI()
	}

	// MARK: - Methods

	func configure(with cellModel: SongCellModel) {
		self.artistNameLable.text = cellModel.artistName
		self.trackNameLable.text = cellModel.trackName
		self.collectionNameLabel.text = cellModel.collectionName
	}

	// MARK: - UI

	override func prepareForReuse() {
		[self.artistNameLable, self.trackNameLable, self.collectionNameLabel].forEach { $0.text = nil }
	}

	private func configureUI() {
		self.addArtworkImageView()
		self.addArtistNameLable()
		self.addTrackNameLable()
		self.addCollectionNameLabel()
	}

	private func addArtworkImageView() {
		self.contentView.addSubview(self.artworkImageView)
		NSLayoutConstraint.activate([
			self.artworkImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
			self.artworkImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
			self.artworkImageView.heightAnchor.constraint(equalToConstant: 60.0),
			self.artworkImageView.widthAnchor.constraint(equalToConstant: 60.0)
		])
	}

	private func addArtistNameLable() {
		self.contentView.addSubview(self.artistNameLable)
		NSLayoutConstraint.activate([
			self.artistNameLable.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
			self.artistNameLable.leftAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: 12.0),
			self.artistNameLable.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
		])
	}

	private func addTrackNameLable() {
		self.contentView.addSubview(self.trackNameLable)
		NSLayoutConstraint.activate([
			self.trackNameLable.topAnchor.constraint(equalTo: self.artistNameLable.bottomAnchor, constant: 4.0),
			self.trackNameLable.leftAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: 12.0),
			self.trackNameLable.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
		])
	}

	private func addCollectionNameLabel() {
		self.contentView.addSubview(self.collectionNameLabel)
		NSLayoutConstraint.activate([
			self.collectionNameLabel.topAnchor.constraint(equalTo: self.trackNameLable.bottomAnchor, constant: 4.0),
			self.collectionNameLabel.leftAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: 12.0),
			self.collectionNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
		])
	}
}

