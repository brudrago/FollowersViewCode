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

    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        interactor.fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    
    // MARK: - Private Funcitons
    
    private func setupNavigationItem() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissScreen))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc
    func dismissScreen() {
        dismiss(animated: true)
    }

}

// MARK: - UserInfoViewControllerProtocol Extension

extension UserInfoViewController: UserInfoViewControllerProtocol {
    
}
