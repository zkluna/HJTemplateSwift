//
//  HJBaseNavigationController.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/17.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit
import BFKit

class HJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(color: .white), for: .default)
    }
}
extension HJNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
