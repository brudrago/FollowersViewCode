//
//  UIImageView.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 09/07/21.
//

import UIKit
import Kingfisher


extension UIImageView {
    
    func load (url: String, completion: (() -> Void)? = nil) {
        kf.setImage(with: URL(string: url),
                    placeholder: R.image.avatarPlaceholder(),
                    options: [.transition(.fade(0.3))],
                    completionHandler: { _ in
                        completion?()
                    })
    }
    
    func cancel() {
        kf.cancelDownloadTask()
    }
}
