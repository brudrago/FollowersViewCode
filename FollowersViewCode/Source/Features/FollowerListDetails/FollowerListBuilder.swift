//
//  FollowerListBuilder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import UIKit

struct FollowerListBuilder {
    
    static func build() -> UIViewController {
        
        let viewController = FollowerListViewController()
        let interactor = FollowerListInteractor()
        let presenter = FollowerListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
