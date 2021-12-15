//
//  PreviewScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class PreviewScreenshotsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

	private var imageArray: [UIImage]

	init(imageArray: [UIImage]) {
		self.imageArray = imageArray
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero,
											  collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(PreviewScreenshotsCollectionViewCell.self, forCellWithReuseIdentifier: PreviewScreenshotsCollectionViewCell.cellIdentifier)
		collectionView.backgroundColor = .white
		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.addSubview(collectionView)
		self.view.backgroundColor = .white
		collectionView.delegate = self
		collectionView.dataSource = self
		setUI()
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imageArray.count
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.width - 10, height:collectionView.frame.size.height - 10)
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewScreenshotsCollectionViewCell.cellIdentifier, for: indexPath) as! PreviewScreenshotsCollectionViewCell
		cell.imageView.image = imageArray[indexPath.row]

		return cell
	}

	private func setUI() {

		NSLayoutConstraint.activate([

			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	func done() {
		self.dismiss(animated: true) { }
	}

}
