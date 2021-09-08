//
//  FollowersViewCodeSnapshotTests.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 07/09/21.
//

import XCTest
import FBSnapshotTestCase
@testable import FollowersViewCode

class FollowersViewCodeSnapshotTests: FBSnapshotTestCase {
    
    var sut: UIView!
    
    override func setUp() {
        super.setUp()
        sut = SearchView()
        self.recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testSearch() {
        FBSnapshotVerifyView(sut)
       
    }
}
