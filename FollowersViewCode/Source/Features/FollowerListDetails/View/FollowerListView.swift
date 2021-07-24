//
//  FollowerListView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit
import SnapKit

class FollowerListView: UIView {
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: self.bounds,
            collectionViewLayout:layout)
        return collectionView
    }()
    
    enum FollowerListSection {
        case main
    }
    
    // MARK: - Private Properties
    
    private var followers: [Follower] = []
    
    private unowned let delegate: FollowerListViewDelegate
    
    // MARK: - Inits
    
    init(_ delegate:FollowerListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func set(follower: [Follower]) {
        self.followers = follower
        collectionView.reloadData()
    }
}

// MARK: - ViewCodeProtocol Extension

extension FollowerListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .clear
        FollowerCell.registerOn(collectionView)
    }
}
// MARK: - UICollectionViewDataSource Extension

extension FollowerListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = FollowerCell.identifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? FollowerCell  else { return UICollectionViewCell()}
        cell.set(follower: self.followers[indexPath.item])
        return cell
    }
}
// MARK: - UICollectionViewDelegate Extension

extension FollowerListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        let lastRowIndex = collectionView.numberOfItems(inSection: indexPath.section) - 1
        
        if lastRowIndex == indexPath.row {
            DispatchQueue.main.async {
                self.delegate.fetchNextPage()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userSelected = followers[indexPath.item]
        delegate.selectedUserInfo(userSelected)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension FollowerListView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let width = bounds.size.width
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let height = itemWidth + 40
        return CGSize(width: itemWidth, height: height)
    }
}


