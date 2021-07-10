//
//  FollowerListBuilder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import UIKit

struct FollowerListBuilder {
    
    static func build(_ username: String?) -> UIViewController {
        
        let viewController = FollowerListViewController()
        let interactor = FollowerListInteractor()
        let presenter = FollowerListPresenter()
        let router = FollowerListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        interactor.username = username
        
        return viewController
    }
}
