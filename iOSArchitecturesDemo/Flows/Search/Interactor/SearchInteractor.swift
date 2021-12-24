//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 20.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchInteractorInput {

	func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)

	func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)

}

class SearchInteractor: SearchInteractorInput {

	private let searchService = ITunesSearchService()

	func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
		searchService.getApps(forQuery: query, then: completion)
	}

	func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
		searchService.getSongs(forQuery: query, completion: completion)
	}
}
