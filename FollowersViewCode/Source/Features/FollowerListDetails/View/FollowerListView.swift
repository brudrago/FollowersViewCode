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
        collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

}

// MARK: - ViewCodeProtocol Extension

extension FollowerListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
    }
}
