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
    
    private lazy var cardItemOne: FVCCardView = {
        let card = FVCCardView()
        card.backgroundColor = .secondarySystemBackground
        return card
    }()
    
    private lazy var cardItemOneStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var itemInfoOne: FVCItemInfoView = {
        let item = FVCItemInfoView()
        return item
    }()
    
    private lazy var itemInfoTwo: FVCItemInfoView = {
        let item = FVCItemInfoView()
        return item
    }()
    
    private lazy var itemInfoButtonAction: FVCButton = {
        let button = FVCButton(
            backgroundColor: .systemPurple,
            title: R.Localizable.githubProfile())
        return button
    }()
    
//    private lazy var cardItemTwo: FVCCardView = {
//        let card = FVCCardView()
//        card.backgroundColor = .systemGreen
//        return card
//    }()
    
    private lazy var cardItemTwo: CardItemTwo = {
        let cardItem = CardItemTwo()
        return cardItem
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
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ??  R.Localizable.notInformed()
        bioLabel.text = user.bio ?? R.Localizable.notAvailable()
        itemInfoOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        cardItemTwo.set(countFollowers: user.followers, countFollowing: user.following)
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
        addSubview(cardItemOne)
        cardItemOne.addSubview(cardItemOneStack)
        cardItemOneStack.addArrangedSubview(itemInfoOne)
        cardItemOneStack.addArrangedSubview(itemInfoTwo)
        cardItemOne.addSubview(itemInfoButtonAction)
        addSubview(cardItemTwo)
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
            make.height.equalTo(12)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(60)
        }
        
        cardItemOne.snp.makeConstraints { make in
            make.top.equalTo(bioLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(140)
        }
        
        cardItemTwo.snp.makeConstraints { make in
            make.top.equalTo(cardItemOne.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(140)
        }
        
        cardItemOneStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        itemInfoButtonAction.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(44)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
