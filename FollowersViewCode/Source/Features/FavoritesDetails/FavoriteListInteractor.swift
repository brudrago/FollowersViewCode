//
//  FavoriteListInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import Foundation

protocol FavoriteListInteractorProtocol {
    
    func getFavorites()
}

class FavoriteListInteractor: FavoriteListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: FavoriteListPresenterProtocol!
    
    //MARK: - Private Properties
    
    private var favoritesList : [Follower] = []
    
    private var persistenceWorker: PersistenceWorkerProtocol
    
    //MARK: - Inits
    
    init() {
        persistenceWorker = PersistenceWorker()
    }
    
    init( persistenceWorker: PersistenceWorkerProtocol) {
        self.persistenceWorker = persistenceWorker
    }
    
    //MARK: - Public Functions
    
    func getFavorites() {
        persistenceWorker.retrieveFavoriteFollower { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let favorites):
                self.didFetchSuccess(favorites)
            case .failure(let error):
                print(error)
                print(error)
                self.didFetchFailed()
            }
        }
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [Follower]?) {
        guard let favorites = response else { return }
        self.favoritesList.append(contentsOf: favorites)
        if favorites.isEmpty {
            DispatchQueue.main.async { self.didFetchEmptyState() }
            return
        }
        
        presenter.set(favorite: favoritesList)
    }
    
    private func didFetchEmptyState() {
        let message = R.Localizable.emptyFavorites()
        presenter.showEmptyState(message)
    }
    
    private func didFetchFailed(){
        let titleMessage = R.Localizable.sorry()
        let message = R.Localizable.somenthingBadHappend()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
}
