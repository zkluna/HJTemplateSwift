//
//  HJProvider.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/17.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import UIKit

class HJProvider {
    static func getRootController() {
        let delegate = UIApplication.shared.delegate
        if !UserDefaults.standard.bool(forKey: HJFirstLaunch) {
            delegate?.window??.rootViewController = WelcomeVC()
        } else {
            delegate?.window??.rootViewController = HJTabBarController()
        }
    }
}
