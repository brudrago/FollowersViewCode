//
//  FavoritListView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import UIKit
import SnapKit

class FavoriteListView: UIView {
    
    // MARK: - UI Components
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    // MARK: - Private Properties
    
    private var favorites: [Follower] = []
    
    private unowned let delegate: FavoriteListViewDelegate
    
    // MARK: - Inits
    
    init(_ delegate: FavoriteListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func set(favorites: [Follower]) {
        self.favorites = favorites
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.bringSubviewToFront(self.tableView)
        }
    }
}

// MARK: - ViewCodeProtocol Extension

extension  FavoriteListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        FavoriteCell.registerOn(tableView)
    }
}

// MARK: - UITableViewDelegate Extension

extension  FavoriteListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - UITableViewDataSource Extension

extension  FavoriteListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FavoriteCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? FavoriteCell
        else { return UITableViewCell() }
       
        cell.set(favorite: favorites[indexPath.row])
       
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favoriteSelected = favorites[indexPath.row]
        delegate.selectedFavorite(favoriteSelected)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favoriteSelected = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        delegate.deleteFavorite(favoriteSelected)
    }
}
