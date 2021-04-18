//
//  SearchPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchPresenterProtocol {
    
    func showAlert(title: String, message: String, buttonTitle: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: SearchViewControllerProtocol!
    
    //MARK: - Public Functions

    func showAlert(title: String, message: String, buttonTitle: String){
        viewController.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
}
