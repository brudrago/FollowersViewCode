//
//  SearchSnapTests.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class SearchSnapTests: XCTestCase {
    
    ///Pra efetuar esse teste é necessário tirar o private do componente textfield
    
    //    func testSearchView() {
    //        let view = SearchView()
    //
    //        view.usernameTextField.text = "tester1"
    //
    //        let size = CGSize(
    //            width: UIScreen.main.bounds.width,
    //            height: UIScreen.main.bounds.height)
    //
    //        assertSnapshot(matching: view, as: Snapshotting.image(size: size), record: false)
    //    }
    
    func testSearch() {
        let vc = build()
        
        assertSnapshot(matching: vc, as: .image, record: false)
    }
    
    // MARK: - Private Functions
    
    private func build() -> SearchViewController {
        let interactor = SearchInteractor()
        
        let presenter = SearchPresenter()
        let viewController = SearchViewController()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.username = "brudrago"
        
        return viewController
    }
}
