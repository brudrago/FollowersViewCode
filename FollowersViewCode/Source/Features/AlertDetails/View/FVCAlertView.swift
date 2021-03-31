//
//  FVCAlertView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

class FVCAlertView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    } ()
    
    private lazy var titleLabel: UILabel = {
        let label = FVCTitleLabel(textAlignment: .center, fontsize: 20)
        return label
    } ()
    
    private lazy var bodyLabel: UILabel = {
        let label = FVCBodyLabel(textAlignment: .center)
        return label
    } ()
    
    private lazy var actionButton: UIButton = {
        let button = FVCButton(
            backgroundColor: .systemPink,
            title: "Ok")
        return button
    } ()
   

    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // MARK: - Private Functions
    
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
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
        
        titleLabel.snp.makeConstraints { make in
         //   make.top.equalTo(containerView).offset(20)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
}
