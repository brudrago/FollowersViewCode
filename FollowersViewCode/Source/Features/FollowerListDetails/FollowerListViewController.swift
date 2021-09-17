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
    
    var router: FollowerListRouterProtocol!
    
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
        setupNavigationAddButtonItem()
    }
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    func showLoading() {
     //   startLoading()
    }
    
    func dismissLoading() {
     //   stopLoading()
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
        definesPresentationContext = true
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - Private Funcitons
    
    private func setupNavigationAddButtonItem() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didSelectAddButton))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc
    private func didSelectAddButton() {
        interactor.addFollowerInFavoriteList()
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
    
    func selectedUserInfo(_ userSelected: Follower) {
        router.proceedToUserInfoDetails(follower: userSelected)
    }
}

// MARK: - UISearchResultsUpdating Extension

extension FollowerListViewController:  UISearchResultsUpdating,  UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text , !filter.isEmpty else {
            interactor.cleanAndUpdateListResultsAfterSearch()
            return
        }
        
        interactor.fetchFilteredFollowers(filter)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        interactor.updateListFollowers()
    }
}
