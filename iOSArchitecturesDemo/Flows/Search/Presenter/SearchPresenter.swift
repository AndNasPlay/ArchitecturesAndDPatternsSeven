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
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    
    private func requestApps(with query: String) {
        searchService.getApps(forQuery: query) { [weak self] (result) in
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
        }
    }

	private func requestSongs(with query: String) {
		searchService.getSongs(forQuery: query){ [weak self] (result) in
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
		}
	}
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }

	private func openSongDetails(with song: ITunesSong) {
		let appDetailViewController = SongDetailViewController(song: song)
		viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
	}
}

extension SearchPresenter: SearchViewOutput {
	func viewDidSearchSong(with query: String) {
		requestSongs(with: query)
	}

	func viewDidSelectSong(_ song: ITunesSong) {
		openSongDetails(with: song)
	}

    func viewDidSearch(with query: String) {
        requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        openAppDetails(with: app)
    }
    
}
