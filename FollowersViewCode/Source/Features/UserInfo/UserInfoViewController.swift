//
//  UserInfoViewController.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit

protocol UserInfoViewControllerProtocol: AnyObject {
    
}

class UserInfoViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: UserInfoInteractorProtocol!
    
    var router: UserInfoRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var userInfoView: UserInfoView = {
        return UserInfoView()
    }()
    
    // MARK: - Public Properties
    
    var follower: Follower!
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Private Funcitons
    
    private func setupNavigationItem() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissScreen))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc
    private func dismissScreen() {
        dismiss(animated: true)
    }

}

// MARK: - UserInfoViewControllerProtocol Extension

extension UserInfoViewController: UserInfoViewControllerProtocol {
    
}
