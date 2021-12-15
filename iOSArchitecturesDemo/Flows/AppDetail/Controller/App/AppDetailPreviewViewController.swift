//
//  AppDetailPreviewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailPreviewViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

	private let app: ITunesApp

	private var imageArray: [UIImage] = []

	private let imageDownLoader = ImageDownloader()

	private(set) lazy var previewScreenshotsViewController = PreviewScreenshotsViewController(imageArray: imageArray)

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

	init(app: ITunesApp) {
		self.app = app
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
		collectionView.register(AppDetailPreviewCollectionViewCell.self, forCellWithReuseIdentifier: AppDetailPreviewCollectionViewCell.cellIdentifier)
		collectionView.backgroundColor = .white
		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.addSubview(collectionView)
		collectionView.delegate = self
		collectionView.dataSource = self
		setUI()
		downloadImage()
	}

	private func downloadImage() {
		let urls = self.app.screenshotUrls

		for counter in 0...urls.count-1 {
			imageDownLoader.getImage(fromUrl: urls[counter]) { [weak self] (image, _) in
				guard let self = self else { return }
				if image != nil {
					DispatchQueue.main.async {
						self.imageArray.append(image!)
						self.collectionView.reloadData()
					}
				}
			}
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imageArray.count
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 130, height: 260)
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailPreviewCollectionViewCell.cellIdentifier, for: indexPath) as! AppDetailPreviewCollectionViewCell
		cell.imageView.image = imageArray[indexPath.row]

		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		previewScreenshotsViewController.modalPresentationStyle = .popover
		previewScreenshotsViewController.modalTransitionStyle = .coverVertical
		present(previewScreenshotsViewController, animated: true, completion: nil)
	}


	private func setUI() {
		self.view.addSubview(previewLable)

		NSLayoutConstraint.activate([

			previewLable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12.0),
			previewLable.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12.0),
			previewLable.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12.0),
			previewLable.heightAnchor.constraint(equalToConstant: 20.0),

			collectionView.topAnchor.constraint(equalTo: previewLable.bottomAnchor, constant: 12.0),
			collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
			collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12.0)
		])
	}

}
