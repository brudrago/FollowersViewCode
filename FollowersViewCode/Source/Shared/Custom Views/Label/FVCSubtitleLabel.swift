//
//  FVCSubtitleLabel.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 11/07/21.
//

import UIKit

class FVCSubtitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontsize: CGFloat){
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontsize, weight: .medium)
        configure()
    }
    
    private func configure() {
        minimumScaleFactor = 0.9
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
