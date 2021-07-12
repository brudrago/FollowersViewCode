//
//  Date + Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 12/07/21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
