//
//  FollowerListVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol FollowerListVCProtocol: AnyObject {
    
}

class FollowerListViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var followerListView = FollowerListView()
    
    // MARK: - Public Properties
    
    var username: String!
    
    // MARK: - VIP Properties
    
    var interactor: FollowerListInteractorProtocol!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}

// MARK: - FollowerListVCProtocol Extension

extension FollowerListViewController: FollowerListVCProtocol {
    
}
