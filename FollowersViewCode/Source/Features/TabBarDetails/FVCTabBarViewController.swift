//
//  FVCTabBarViewController.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 25/07/21.
//

import UIKit

class FVCTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
       viewControllers = [createSearchNavigationController(),
                          createFavoritesNavigationController()]
    }

    func createFavoritesNavigationController() -> UINavigationController {
        let favoriteVC = FavoriteListBuilder.build()
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchBuilder.build()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }

}
