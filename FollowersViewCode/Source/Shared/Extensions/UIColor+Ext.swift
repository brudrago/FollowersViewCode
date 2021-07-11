//
//  UIColor+Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 11/07/21.
//

import UIKit

extension UIColor {
    
    // MARK: - Init
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1.0)
    }
    
    // MARK: - Proportion Colors
    
    static let shadow = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.05)
    
    static let silver = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.0)
}
