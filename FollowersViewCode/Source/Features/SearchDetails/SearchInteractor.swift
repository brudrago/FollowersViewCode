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
            presenter.showAlert()
            //verificar se tem numero minimo de caracteres
            print("chamar o alerta aqui")
        }
    }
}
