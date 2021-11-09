//
//  FavoritesSnapTests.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class FavoritesSnapTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var persistenceWorker: PersistenceWorkerProtocol!
    
    // MARK: - Test Lifecycle
    override func setUp() {
        self.persistenceWorker = PersistenceWorkerSnapMock()
    }
    
    func testFavoritesList() throws {
        let vc = build()
        
        assertSnapshot(matching: vc, as: .image, record: false)
    }
    
    // MARK: - Private Functions
    
    private func build() -> FavoriteListVC {
        let interactor = FavoriteListInteractor(persistenceWorker: persistenceWorker)
        let presenter = FavoriteListPresenter()
        let viewController = FavoriteListVC()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
