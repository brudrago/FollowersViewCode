//
//  UserInfoViewController.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit

protocol UserInfoViewControllerProtocol: AnyObject {
    
    func set(user: User)
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
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
    
    func set(user: User) {
        userInfoView.set(user: user)
    }
}
