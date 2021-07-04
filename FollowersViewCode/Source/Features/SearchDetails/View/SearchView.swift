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
        logo.image = R.image.ghLogo()
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = FVCTextField()
        textField.placeholder = R.Localizable.emptyUsername()
        textField.delegate = self 
        return textField
    } ()
    
    private lazy var searchFollowerButton: UIButton = {
        let button = FVCButton(
            backgroundColor: .systemGreen,
            title: R.Localizable.searchFollowers())
        return button
    } ()
    
    weak var delegate: SearchViewDelegate?
    
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
    
    func getUsername() -> String {
        return usernameTextField.text ?? ""
    }
    
    // MARK: - Private Functions
    
    @objc
    private func didSelecSearchFollowerButton(_ button: FVCButton) {
        
    }
}

// MARK: - ViewCodeProtocol Extension

extension SearchView: ViewCodeProtocol {
    
    func  setupSubviews()  {
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(searchFollowerButton)
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
        
        searchFollowerButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(50)
            make.left.equalTo(safeAreaLayoutGuide).offset(50)
            make.right.equalTo(safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        let searchFollowerButtonAction = #selector(didSelecSearchFollowerButton(_:))
        searchFollowerButton.addTarget(self, action: searchFollowerButtonAction, for: .touchUpInside)
    }
}

// MARK: - UITextField Delegate Extension

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // chamar algo da textfield/button aqui
        return true
    }
}
