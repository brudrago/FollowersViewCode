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
    
    func fetchFollowers(_ username: String)
}

class SearchInteractor : SearchInteractorProtocol, SearchDataStoreProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: SearchPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String?
    
    //MARK: - Private Properties
    
    private var followerWorker: FollowerWorkerProtocol
    
    private var page = 1
    
    //MARK: - Inits
    
    init() {
        followerWorker = FollowerWorker()
    }
    
    init(followerWorker: FollowerWorkerProtocol) {
        self.followerWorker = followerWorker
    }
    
    //MARK: - Public Functions
    
    func validate(_ username: String) {
        guard validate(username) else { return }
        self.username = username
        presenter.searchFollowers()
    }
    
    //implementar no followerList
    func fetchFollowers(_ username: String) {
        guard validate(username) else { return }
        
        self.username = username
        
        followerWorker.fetchList(for: username, page: page) { [weak self] result in
            switch result {
            case .success(let followerResponse):
                print("====== LIST\(followerResponse)")
            case .failure(let error):
                print("====== ER\(error)")
            }
        }
    }
    
    //MARK: - Private Functions
    
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
