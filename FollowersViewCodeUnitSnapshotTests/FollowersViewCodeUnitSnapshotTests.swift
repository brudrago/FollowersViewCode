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
    
   // var view: UIView!
    var controller: UIViewController!
    
    override func setUp() {
        super.setUp()
        self.recordMode = true
//        view = SearchView()
        controller = SearchViewController()
    }
    
    override func tearDown() {
        super.tearDown()
//        view = nil
//        controller = nil
    }
    
    func testExample() {
//     FBSnapshotVerifyView(view)
     FBSnapshotVerifyViewController(controller)
        
    }
}
