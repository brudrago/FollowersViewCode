//
//  UserInfoView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import UIKit

class UserInfoView: UIView {
    
    // MARK: - UI Components
    
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

extension UserInfoView: ViewCodeProtocol {
    func setupSubviews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupComponents() {
        backgroundColor = .systemPink
    }
}
