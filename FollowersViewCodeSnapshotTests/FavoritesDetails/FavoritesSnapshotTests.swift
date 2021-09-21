//
//  FavoritesSnapshotTests.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 21/09/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class FavoritesSnapshotTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var persistenceWorker: PersistenceWorkerProtocol!
    
    // MARK: - Test Lifecycle

    override func setUp() {
        self.persistenceWorker = PersistenceWorkerMockSnapshot()
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


