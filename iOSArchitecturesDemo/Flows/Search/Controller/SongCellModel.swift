//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 13.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
	let artistName: String?
	let trackName: String?
	let collectionName: String?
}

final class SongCellModelFactory {

	static func cellModel(from model: ITunesSong) -> SongCellModel {
		return SongCellModel(artistName: model.artistName,
							 trackName: model.trackName,
							 collectionName: model.collectionName)
	}
}
