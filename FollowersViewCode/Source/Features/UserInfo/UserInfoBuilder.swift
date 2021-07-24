//
//  UserInfoBuilder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit

struct UserInfoBuilder {
    
    static func build(follower: Follower) -> UIViewController {
        let viewController = UserInfoViewController()
        let interactor = UserInfoInteractor()
        let presenter = UserInfoPresenter()
        let router = UserInfoRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        interactor.follower = follower
        
        return viewController
    }
}
