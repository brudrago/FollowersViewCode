//
//  FollowersViewCodeUnitSnapshotTests.swift
//  FollowersViewCodeUnitSnapshotTests
//
//  Created by Bruna Drago on 07/09/21.
//

import XCTest
import FBSnapshotTestCase
@testable import FollowersViewCode

class FollowersViewCodeUnitSnapshotTests: FBSnapshotTestCase {
    
    let controller = SearchView()

    override func setUp() {
        super.setUp()
        recordMode = true
    }

    func testView() {
        FBSnapshotVerifyView(controller)
    }
}
