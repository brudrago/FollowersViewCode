//
//  FVCCardView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 11/07/21.
//

import UIKit

class FVCCardView: UIView {

    // MARK: - Public Properties
    
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
            self.layer.shadowPath = self.bezierPath.cgPath
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable var shadowColored: UIColor? = .shadow {
        didSet {
            self.layer.shadowColor = self.shadowColored?.cgColor
        }
    }
    
    @IBInspectable var borderedWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = self.borderedWidth
        }
    }
    
    @IBInspectable var borderedColor: UIColor = .silver {
        didSet {
            self.layer.borderColor = self.borderedColor.cgColor
        }
    }
    
    // MARK: - Private Properties
    
    private var bezierPath: UIBezierPath {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius)
        return path
    }
    
    // MARK: - View Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowPath = self.bezierPath.cgPath
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.borderWidth = self.borderedWidth
        self.layer.borderColor = self.borderedColor.cgColor
        self.layer.shadowColor = self.shadowColored?.cgColor
    }

}
