//
//  FavoriteListVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol FavoriteListVCProtocol: AnyObject {
    
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
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = R.Localizable.favorite()
    }

}

extension FavoriteListVC: FavoriteListVCProtocol {
    
}
