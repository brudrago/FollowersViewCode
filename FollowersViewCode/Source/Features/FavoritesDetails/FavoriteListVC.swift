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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }

}

extension FavoriteListVC: FavoriteListVCProtocol {
    
}
