//
//  SearchInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchDataStoreProtocol {
    
    var username: String? { get set }
}

protocol SearchInteractorProtocol {
    
    func validate(_ username: String)
}

class SearchInteractor : SearchInteractorProtocol, SearchDataStoreProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: SearchPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String?
    
    //MARK: - Public Functions
    
    func validate(_ username: String) {
        guard validate(username) else { return }
    }
    
   private func validate(_ name: String) -> Bool {
    let isUsernameEmpty = name.isEmpty
    let isUsernameValid = isUsernameValid(name)
    
    if isUsernameEmpty {
        let titleMessage = R.Localizable.hello()
        let message = R.Localizable.emptyUsername()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
        return false
    }
    
    if !isUsernameValid {
        let titleMessage = R.Localizable.hello()
        let message = R.Localizable.invalidUsername()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
        return false
    }
        return true
    }
    
    private func isUsernameValid(_ username: String) -> Bool {
        let userName = username
        return userName.count > 2
    }
}
