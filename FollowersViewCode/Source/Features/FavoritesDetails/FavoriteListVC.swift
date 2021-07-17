//
//  FavoriteListVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol FavoriteListVCProtocol: AnyObject {
    
    func set(favorite: [Follower])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
    
    func showEmptyState(_ message: String)
}

class FavoriteListVC: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: FavoriteListInteractorProtocol!
    
    var router: FavoriteListRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var favoritesView: FavoriteListView = {
        return FavoriteListView()
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = favoritesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        interactor.getFavorites()
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
        title = R.Localizable.favorite()
    }

}

extension FavoriteListVC: FavoriteListVCProtocol {
    
    func set(favorite: [Follower]) {
        favoritesView.set(favorites: favorite)
    }
}
