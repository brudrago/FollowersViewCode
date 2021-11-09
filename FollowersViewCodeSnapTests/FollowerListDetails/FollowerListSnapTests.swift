//
//  FollowerListSnapTests.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class FollowerListSnapTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var followerWorker: FollowerWorkerProtocol!
    
    var userWorker: UserInfoWorkerProtocol!
    
    var persistenceWorker: PersistenceWorkerProtocol!
    
    // MARK: - Test Lifecycle
    override func setUp() {
        self.followerWorker = FollowerWorkerSnapMock()
        self.userWorker = UserWorkerSnapMock()
        self.persistenceWorker = PersistenceWorkerSnapMock()
    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFollowerListController() throws {
        let vc = build()
        vc.interactor.fetchFollowers()
        
        assertSnapshot(matching: vc, as: .image, record: false)
    }
    
    // MARK: - Private Functions
    
    private func build() -> FollowerListViewController {
        let interactor = FollowerListInteractor(
            followerWorker: followerWorker,
            userWorker: userWorker,
            persistenceWorker: persistenceWorker)

        let presenter = FollowerListPresenter()
        let viewController = FollowerListViewController()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController

        interactor.username = "brudrago"

        return viewController
    }
}
