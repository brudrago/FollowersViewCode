//
//  FavoriteCell.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: FavoriteCell.self)
    
    // MARK: - UI Components
    
    private lazy var avatarImageView: FVCAvatarImageView = {
        let imageView = FVCAvatarImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var usernameLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(
            textAlignment: .center, fontsize: 26)
        return label
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.load(url: favorite.avatarUrl)
    }
}

// MARK: - ViewCode Protocol Extension

extension FavoriteCell: ViewCodeProtocol {
    
    func setupSubviews() { 
        addSubviews(avatarImageView, usernameLabel)
    }
    
    func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(avatarImageView.snp.right).offset(24)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(40)
        }
    }
    
    func setupComponents() {
        accessoryType = .disclosureIndicator
    }
}
