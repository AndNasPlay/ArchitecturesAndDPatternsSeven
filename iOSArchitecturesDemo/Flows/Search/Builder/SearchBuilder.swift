//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let presenter = SearchPresenter()
		let viewController = SearchViewController(presenter: presenter, searchType: .app)
        presenter.viewInput = viewController
        
        return viewController
    }

	static func buildSongFinder() -> (UIViewController & SearchViewInput) {
		let presenter = SearchPresenter()
		let viewController = SearchViewController(presenter: presenter, searchType: .song)
		presenter.viewInput = viewController

		return viewController
	}
    
}
