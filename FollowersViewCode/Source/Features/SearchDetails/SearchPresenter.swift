//
//  SearchPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchPresenterProtocol {
    
    func showAlert()
}

class SearchPresenter: SearchPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: SearchViewControllerProtocol!
    
    //MARK: - Public Functions

    func showAlert() {
        viewController.showAlert()
    }

}
