//
//  UserInfoView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    
    // MARK: - UI Components
    
    private lazy var avatarImageView: FVCAvatarImageView = {
        let imageView = FVCAvatarImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var usernameLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(
            textAlignment: .left, fontsize: 34)
        return label
    }()
    
    private lazy var nameLabel: FVCSubtitleLabel = {
        let label = FVCSubtitleLabel(fontsize: 18)
        return label
    }()
    
    private var locationImageView: UIImageView = {
       let imageView = UIImageView()
        imageView .image = UIImage(systemName: SFSymbols.location)
        imageView .tintColor = .secondaryLabel
        return imageView
    }()
    
    private lazy var locationLabel: FVCSubtitleLabel = {
        let label = FVCSubtitleLabel(fontsize: 18)
        return label
    }()
    
    private lazy var bioLabel: FVCBodyLabel = {
        let label = FVCBodyLabel(textAlignment: .left)
        label.numberOfLines = 3
        return label
    }()
    
    // MARK: - Private Properties
    
    private var user: User!
    
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
    
    func set(user: User) {
        self.user = user
        avatarImageView.load(url: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? R.Localizable.notInformed()
        locationLabel.text = user.location ??  R.Localizable.notInformed()
        bioLabel.text = user.bio ?? R.Localizable.notAvailable()
    }
}

// MARK: - ViewCodeProtocol Extension

extension UserInfoView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(nameLabel)
        addSubview(locationImageView)
        addSubview(locationLabel)
        addSubview(bioLabel)
    }
    
    func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(8)
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(20)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.left.equalTo(locationImageView.snp.right).offset(5)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(12)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
            make.left.equalTo(avatarImageView.snp.right)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(60)
        }
        
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
