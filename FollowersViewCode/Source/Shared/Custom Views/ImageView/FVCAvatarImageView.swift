//
//  FVCAvatarImageView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 07/07/21.
//

import UIKit

class FVCAvatarImageView: UIImageView {
    
    let placeholder = R.image.avatarPlaceholder()
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = placeholder
        translatesAutoresizingMaskIntoConstraints = false
    }
}

