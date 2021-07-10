//
//  FVCEmptyStateView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 09/07/21.
//

import UIKit
import SnapKit

class FVCEmptyStateView: UIView {
    
    // MARK: - UI Components
    
    private lazy var messageLabel: FVCTitleLabel = {
        let label = FVCTitleLabel(textAlignment: .center, fontsize: 28)
        label.numberOfLines = 3
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.emptyStateLogo()
        return imageView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        setupUI()
    }
    
}

// MARK: - ViewCode Protocol

extension FVCEmptyStateView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(messageLabel)
        addSubview(logoImageView)
    }
    
    func setupConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-150)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(1.3)
            make.height.equalTo(logoImageView.snp.width).multipliedBy(1.3)
            make.left.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().inset(-40)
        }
    }
    
    func setupComponents() {
        
    }
    
}
