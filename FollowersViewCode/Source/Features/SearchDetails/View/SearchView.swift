//
//  SearchView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "gh-logo")
        return logo
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = FVCTextField(placeholder: "Digite o username")
        return textField
    } ()
    
    private lazy var actionButton: UIButton = {
        let button = FVCButton(
            backgroundColor: .systemGreen,
            title: "Buscar Seguidores")
        return button
    } ()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func  setupSubviews()  {
        addSubview(logoImageView)
    }
    
}

