//
//  FavoritListView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import UIKit
import SnapKit

class FavoritListView: UIView {
    
    // MARK: - UI Components
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()

}

// MARK: - ViewCodeProtocol Extension

extension  FavoritListView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
    }
    
    func setupComponents() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate Extension

extension  FavoritListView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource Extension

extension  FavoritListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
