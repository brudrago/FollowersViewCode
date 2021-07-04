//
//  FVCAlertVC.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import UIKit

class FVCAlertVC: UIViewController {
    
    // MARK: - Private Properties
    
    private var alertView = FVCAlertView()
    
    // MARK: - Public Properties
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    // MARK: - Inits
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = alertView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.delegate = self
        alertView.set(title: alertTitle, message: message, buttonTitle: buttonTitle)
    }

    
}
// MARK: - SearchViewDelegate Extension

extension FVCAlertVC: FVCAlertViewDelegate {
    
    func dismissVC() {
        dismiss(animated: true)
    }
}
