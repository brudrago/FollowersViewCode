//
//  UIViewController+Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 02/04/21.
//

import UIKit
//import SnapKit
import SafariServices

fileprivate var containerView: UIView?

extension UIViewController {
    
    func  presentFVCAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = FVCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func startLoading() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView ?? UIView())
        
        containerView?.backgroundColor = .systemBackground
        containerView?.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView?.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .systemGreen
        
        containerView?.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            containerView?.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = FVCEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    func presentSafariViewController(with url: String) {
        guard let newURL = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: newURL)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
}
