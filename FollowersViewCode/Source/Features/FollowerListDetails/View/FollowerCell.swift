//
//  FollowerCell.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 07/07/21.
//

import UIKit
import SnapKit

class FollowerCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: FollowerCell.self)
    
    // MARK: - UI Components
    
    private lazy var avatarImageView: FVCAvatarImageView = {
        let imageView = FVCAvatarImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var usernameLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(
            textAlignment: .center, fontsize: 16)
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
    }
    
}

// MARK: - ViewCode Protocol Extension

extension FollowerCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    func setupConstraints() {
        
        avatarImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(avatarImageView.snp.width)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
    }
    
    
}
