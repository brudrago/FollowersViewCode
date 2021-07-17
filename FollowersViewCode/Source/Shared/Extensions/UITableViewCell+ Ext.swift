//
//  UITableViewCell+ Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import UIKit

extension UITableViewCell {
    
    static func registerOn(_ tableView: UITableView) {
         let reuseIdentifier = String(describing: self.self)
         tableView.register(self.self, forCellReuseIdentifier: reuseIdentifier)
     }
}
