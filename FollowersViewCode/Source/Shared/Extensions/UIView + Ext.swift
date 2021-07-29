//
//  UIView + Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/07/21.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {  addSubview(view)}
    }
}

///Variadic Parameter
