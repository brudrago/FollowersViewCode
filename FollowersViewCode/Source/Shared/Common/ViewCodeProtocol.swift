//
//  ViewCodeProtocol.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol ViewCodeProtocol {
    
    func setupSubviews()
    
    func setupConstraints()
    
    func setupComponents()
}

extension ViewCodeProtocol {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupComponents()
    }
    
    func setupComponents() {}
}
