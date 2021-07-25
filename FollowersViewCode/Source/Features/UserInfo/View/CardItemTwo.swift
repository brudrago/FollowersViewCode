//
//  CardItemTwo.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 11/07/21.
//

import UIKit

class CardItemTwo: FVCCardView {
    
    // MARK: - UI Components
    
    private lazy var cardItemStack: UIStackView = {
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
            backgroundColor: .systemGreen,
            title: R.Localizable.getFollowers())
        return button
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
    
    // MARK: - Public Functions
    
    func set(countFollowers: Int, countFollowing: Int) {
        itemInfoOne.set(itemInfoType: .followers, withCount: countFollowers)
        itemInfoTwo.set(itemInfoType: .following, withCount: countFollowing)
    }
    
    func setItemInfoButtonActionTarget(_ target: Any?, action: Selector) {
        itemInfoButtonAction.addTarget(target, action: action, for: .touchUpInside)
    }
}

// MARK: - ViewCodeProtocol Extension

extension CardItemTwo: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(cardItemStack)
        cardItemStack.addArrangedSubview(itemInfoOne)
        cardItemStack.addArrangedSubview(itemInfoTwo)
        addSubview(itemInfoButtonAction)
    }
    
    func setupConstraints() {
        cardItemStack.snp.makeConstraints { make in
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
        backgroundColor = .secondarySystemBackground
    }
}
