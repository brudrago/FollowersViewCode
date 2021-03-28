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
        textField.delegate = self 
        return textField
    } ()
    
    private lazy var actionButton: UIButton = {
        let button = FVCButton(
            backgroundColor: .systemGreen,
            title: "Buscar Seguidores")
        button.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        return button
    } ()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    @objc
    private func pushFollowerListVC() {
        
       
    }
}

extension SearchView: ViewCodeProtocol {
    
    func  setupSubviews()  {
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.left.equalTo(safeAreaLayoutGuide).offset(50)
            make.right.equalTo(safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(50)
            make.left.equalTo(safeAreaLayoutGuide).offset(50)
            make.right.equalTo(safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}
