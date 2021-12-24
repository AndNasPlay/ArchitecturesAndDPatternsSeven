//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 20.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
	func openSongDetails(for song: ITunesSong)
	func openAppDetails(for app: ITunesApp)
}

class SearchRouter: SearchRouterInput {

	weak var viewController: UIViewController?

	func openAppDetails(for app: ITunesApp) {
		let appDetailViewController = AppDetailViewController(app: app)
		viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
	}

	func openSongDetails(for song: ITunesSong) {
		let songDetailViewController = SongDetailViewController(song: song)
		viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
	}

}
