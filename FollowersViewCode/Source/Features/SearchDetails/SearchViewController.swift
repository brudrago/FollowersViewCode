//
//  SearchVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func searchFollowers()
}

class SearchViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: SearchInteractorProtocol!
    
    var router: SearchRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var searchView: SearchView = {
        return SearchView()
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    func searchFollowers() {
        router.proceedToFollowerList()
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private  func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - SearchViewDelegate Extension

extension SearchViewController: SearchViewDelegate {
    
    func didSelectSearchFollowerButton(username: String?) {
        guard let user = username else { return }
        interactor.validate(user)
    }
}

// MARK: - SearchViewControllerProtocol Extension

extension SearchViewController: SearchViewControllerProtocol { }


