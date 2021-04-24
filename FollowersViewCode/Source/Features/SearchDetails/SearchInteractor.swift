//
//  SearchInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchInteractorProtocol {
    
    func validate(_ username: String)
}

class SearchInteractor : SearchInteractorProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: SearchPresenterProtocol!
    
    //MARK: - Public Functions
    
    func validate(_ username: String) {
        
        if username.isEmpty {
            let title = "Hey!"
            let message = "Digite o username 🤖"
            let buttonTitle = "Ok"
            presenter.showAlert(title: title, message: message, buttonTitle: buttonTitle)
            print("?????????")
            return
            //verificar se tem numero minimo de caracteres
        }
    }
}
