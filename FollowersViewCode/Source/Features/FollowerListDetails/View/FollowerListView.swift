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
       let collectionView = UICollectionView(
        frame: self.bounds,
        collectionViewLayout: createThreeColumnFlowLayout())
        return collectionView
    }()
    
    enum FollowerListSection {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<FollowerListSection, Follower>!
    
  //  private unowned let delegate: FollowerListViewDelegate
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Functions
    
    func set(follower: Follower) {
        
    }
    
    // MARK: - Private Functions
    
    private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let padding: CGFloat = 12
        let width = self.bounds.width
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let height = itemWidth + 40
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: height)
        
        return flowLayout
    }
    
    private func configureDataSource() {
        let identifier = FollowerCell.identifier
        dataSource = UICollectionViewDiffableDataSource<FollowerListSection, Follower>(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? FollowerCell else { return UICollectionViewCell() }
               // cell.set(follower: )
                return cell
            })
    }
}

// MARK: - ViewCodeProtocol Extension

extension FollowerListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
    }
}
