//
//  UserInfoViewController.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit
import SafariServices

protocol UserInfoViewControllerProtocol: AnyObject {
    
    func set(user: User)
    
    func showUserProfile(for url: String)
    
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
        return UserInfoView(self)
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
    
    func showUserProfile(for url: String) {
        guard let profileURL = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: profileURL)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
}

// MARK: - UserInfoViewDelegate Extension

extension UserInfoViewController: UserInfoViewDelegate {
    
    func didSelectCardItemOneGetProfileButton() {
        router.proceedToUserProfile()
        print("GET PROFILE BUTTON")
    }
    
    func didSelectCardItemTwoGetFollowersButton() {
        #warning("implementar action no interactor")
        print("GET FOLLOWERS BUTTON")
    }
}
