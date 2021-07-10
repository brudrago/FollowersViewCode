//
//  FollowerListVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol FollowerListViewControllerProtocol: AnyObject {
    
    func set(follower: [Follower])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
    
    func showEmptyState(_ message: String)
}

class FollowerListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: FollowerListInteractorProtocol!
    
    // MARK: - Private Properties
    
    private lazy var followerListView: FollowerListView = {
        return FollowerListView(self)
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = followerListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        setupNavigationItem()
    }
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    func showLoading() {
        startLoading()
    }
    
    func dismissLoading() {
        stopLoading()
    }
    
    func showEmptyState(_ message: String) {
        showEmptyStateView(with: message, in: self.view)
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupNavigationItem() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation   = false
        search.searchBar.placeholder = R.Localizable.searchByUsername()
        //search.searchBar.barTintColor = .black
        definesPresentationContext = true
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// MARK: - FollowerListVCProtocol Extension

extension FollowerListViewController: FollowerListViewControllerProtocol {
    
    func set(follower: [Follower]) {
        followerListView.set(follower: follower)
    }
}

// MARK: - FollowerListViewDelegate Extension

extension FollowerListViewController: FollowerListViewDelegate {
    
    func fetchNextPage() {
        interactor.fetchNextPage()
    }
}

// MARK: - UISearchResultsUpdating Extension

extension FollowerListViewController:  UISearchResultsUpdating,  UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("CANCEL BUTTON")
        #warning("implementar update do array")
    }
}
