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
}

class FollowerListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: FollowerListInteractorProtocol!
    
    // MARK: - Private Properties
    
    private lazy var followerListView: FollowerListView = {
        return FollowerListView()
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
    }
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - FollowerListVCProtocol Extension

extension FollowerListViewController: FollowerListViewControllerProtocol {
    
    func set(follower: [Follower]) {
        followerListView.set(follower: follower)
    }
}
