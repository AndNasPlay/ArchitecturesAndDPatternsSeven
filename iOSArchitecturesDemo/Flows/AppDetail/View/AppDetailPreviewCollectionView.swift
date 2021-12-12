//
//  AppDetailPreviewCollectionView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailPreviewCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

	let cells = PictureStorage.shared.pictureCollectionViewDictionary

	init() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		super.init(frame: .zero, collectionViewLayout: layout)
		delegate = self
		dataSource = self
		translatesAutoresizingMaskIntoConstraints = false
		register(AppDetailPreviewCollectionViewCell.self, forCellWithReuseIdentifier: AppDetailPreviewCollectionViewCell.cellIdentifier)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cells.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = dequeueReusableCell(withReuseIdentifier: AppDetailPreviewCollectionViewCell.cellIdentifier, for: indexPath)
		return cell
	}
}
