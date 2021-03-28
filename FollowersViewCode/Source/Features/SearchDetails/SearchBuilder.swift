//
//  SearchBuilder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

struct SearchBuilder {
    
    static func build() -> UIViewController {
        let viewController = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
      //  presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
