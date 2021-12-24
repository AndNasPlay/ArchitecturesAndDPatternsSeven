//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchViewInput: AnyObject {
	var searchResults: [ITunesApp] { get set }
	var searchResultsSongs: [ITunesSong] { get set }
	func showError(error: Error)
	func showNoResults()
	func hideNoResults()
	func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
	func viewDidSearch(with query: String)
	func viewDidSearchSong(with query: String)
	func viewDidSelectApp(_ app: ITunesApp)
	func viewDidSelectSong(_ song: ITunesSong)
}

class SearchPresenter {

	private let searchService = ITunesSearchService()

	let interactor: SearchInteractorInput

	let router: SearchRouterInput

	weak var viewInput: (UIViewController & SearchViewInput)?

	init(interactor: SearchInteractorInput, router: SearchRouterInput) {
		self.interactor = interactor
		self.router = router
	}
}

extension SearchPresenter: SearchViewOutput {
	func viewDidSearchSong(with query: String) {
		interactor.requestSongs(with: query, completion: { [weak self] (result) in
			guard let self = self else { return }

			self.viewInput?.throbber(show: false)
			result.withValue { (songs) in
				guard !songs.isEmpty else {
					self.viewInput?.showNoResults()
					return
				}
				self.viewInput?.hideNoResults()
				self.viewInput?.searchResultsSongs = songs
			}.withError { (error) in
				self.viewInput?.showError(error: error)
			}
		})
	}

	func viewDidSelectSong(_ song: ITunesSong) {
		router.openSongDetails(for: song)
	}

	func viewDidSearch(with query: String) {
		interactor.requestApps(with: query, completion:  { [weak self] (result) in
			guard let self = self else { return }

			self.viewInput?.throbber(show: false)
			result.withValue { (apps) in
				guard !apps.isEmpty else {
					self.viewInput?.showNoResults()
					return
				}
				self.viewInput?.hideNoResults()
				self.viewInput?.searchResults = apps
			}.withError { (error) in
				self.viewInput?.showError(error: error)
			}
		})
	}

	func viewDidSelectApp(_ app: ITunesApp) {
		router.openAppDetails(for: app)
	}

}
