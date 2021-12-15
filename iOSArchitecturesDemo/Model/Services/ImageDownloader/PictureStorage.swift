//
//  PictureStorage.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 08.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class PictureStorage {

	public static let shared = PictureStorage()

	private init() { }

	var pictureDictionary: [String: UIImage] = [:]

	var songImgDictionary: [String: UIImage] = [:]

	var pictureCollectionViewDictionary: [String: UIImage] = [:]

}

