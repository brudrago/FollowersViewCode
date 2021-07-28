//
//  FVCItemInfoView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 11/07/21.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class FVCItemInfoView: UIView {
    
    private var symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView .image = SFSymbols.location
        imageView .tintColor = .label
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(
            textAlignment: .left, fontsize: 14)
        return label
    }()
    
    private lazy var countLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(
            textAlignment: .left, fontsize: 14)
        return label
    }()
    
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Functions
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = R.Localizable.publicRepos()
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = R.Localizable.publicGists()
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = R.Localizable.followers()
        case .following:
            symbolImageView.image =  SFSymbols.following
            titleLabel.text = R.Localizable.following()
        }
        
        countLabel.text = String(count)
    }
}

extension FVCItemInfoView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
    }
    
    func setupConstraints() {
        symbolImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(symbolImageView.snp.centerY)
            make.left.equalTo(symbolImageView.snp.right).offset(12)
            make.right.equalToSuperview()
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView.snp.bottom).offset(4)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(18)
        }
    }
}
