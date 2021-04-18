//
//  SearchVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    
    func showAlert(title: String, message: String, buttonTitle: String)
}

class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchView = SearchView()
    
    // MARK: - VIP Properties
    
    var interactor: SearchInteractorProtocol!
    
    var router: SearchRouterProtocol!
    
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
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Public Functions
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
      presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
}

// MARK: - SearchViewDelegate Extension

extension SearchViewController: SearchViewDelegate {
    
    func sendUsername(username: String) {
        interactor.validate(username)
        router.proceedToFollowerList(username: username)
    }
}

// MARK: - SearchViewControllerProtocol Extension

extension SearchViewController: SearchViewControllerProtocol {
    
}


