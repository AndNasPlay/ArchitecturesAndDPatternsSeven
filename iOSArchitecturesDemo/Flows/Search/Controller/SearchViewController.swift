//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchView: SearchView {
        return self.view as! SearchView
    }

	var searchType: SearchModel
    
    private let searchService = ITunesSearchService()
    var searchResults = [ITunesApp]() {
        didSet {
            searchView.tableView.isHidden = false
            searchView.tableView.reloadData()
            searchView.searchBar.resignFirstResponder()
        }
    }

	var searchResultsSongs = [ITunesSong]() {
		didSet {
			searchView.tableView.isHidden = false
			searchView.tableView.reloadData()
			searchView.searchBar.resignFirstResponder()
		}
	}
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    private let presenter: SearchViewOutput
    
	init(presenter: SearchViewOutput, searchType: SearchModel) {
        self.presenter = presenter
		self.searchType = searchType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searchType == .app {
			return searchResults.count
		} else {
			return searchResultsSongs.count
		}

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? AppCell else {
            return dequeuedCell
        }
		if searchType == .app {
			let app = self.searchResults[indexPath.row]
			let cellModel = AppCellModelFactory.cellModel(from: app)
			cell.configure(with: cellModel)
			return cell
		} else {
			let song = self.searchResultsSongs[indexPath.row]
			let cellModel = SongCellModelFactory.cellModel(from: song)
			cell.configureSong(with: cellModel)
			return cell
		}
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
		if searchType == .app {
			let app = searchResults[indexPath.row]
			let appDetaillViewController = AppDetailViewController(app: app)
			appDetaillViewController.app = app
			presenter.viewDidSelectApp(app)
		} else {
			let song = searchResultsSongs[indexPath.row]
			let songDetaillViewController = SongDetailViewController(song: song)
			songDetaillViewController.song = song
			presenter.viewDidSelectSong(song)
		}
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }

		if searchType == .app {
			presenter.viewDidSearch(with: query)
		} else {
			presenter.viewDidSearchSong(with: query)
		}
    }
}

extension SearchViewController: SearchViewInput {

	func throbber(show: Bool) { }

    // MARK: - Private

    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
}
