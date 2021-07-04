//
//  FVCAlertView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

protocol FVCAlertViewDelegate: AnyObject {
    
    func dismissVC()
}

class FVCAlertView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    } ()
    
    private lazy var titleLabel: UILabel = {
        let label = FVCTitleLabel(textAlignment: .center, fontsize: 20)
      //  label.text = alertTitle ?? "Atenção"
        return label
    } ()
    
    private lazy var bodyLabel: UILabel = {
        let label = FVCBodyLabel(textAlignment: .center)
      //  label.text = message ?? "Não foi possível completar esta tarefa"
        label.numberOfLines = 4
        return label
    } ()
    
    private lazy var actionButton: UIButton = {
        let button = FVCButton(
            backgroundColor: .systemPink,
            title: buttonTitle ?? "Ok")
        button.addTarget(self, action: #selector(actionButtontapped), for: .touchUpInside)
        return button
    } ()
    
    weak var delegate: FVCAlertViewDelegate?
    
    // MARK: - Public Properties
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        configure()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Functions
    
    func set(title: String?, message: String?, buttonTitle: String?) {
        titleLabel.text = title
        bodyLabel.text = message
        actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    // MARK: - Private Functions
    
    @objc
    private func actionButtontapped() {
        delegate?.dismissVC()
    }
    
    private func configure() {
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
    }
}
extension FVCAlertView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(actionButton)
        containerView.addSubview(bodyLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(28)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(44)
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(actionButton.snp.top).offset(-12)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
}
