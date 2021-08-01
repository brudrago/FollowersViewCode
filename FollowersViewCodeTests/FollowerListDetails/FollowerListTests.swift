//
//  FollowerListTests.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 01/08/21.
//

import XCTest
@testable import FollowersViewCode

class FollowerListTests: XCTestCase {

    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = FollowerListInteractor()
        XCTAssertNotNil(interactor)
    }
    #warning("add workers mock")
//    func fetchFollowers()
//
//    func fetchNextPage()
//
//    func fetchFilteredFollowers(_ filter: String)
//
//    func cleanAndUpdateListResultsAfterSearch()
//
//    func updateListFollowers()
//
//    func addFollowerInFavoriteList()
}
