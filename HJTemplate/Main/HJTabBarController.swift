//
//  HJTabBarController.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/18.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import UIKit
import ESTabBarController_swift

class HJTabBarController : ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpChildrenVCs()
    }
    func setUpChildrenVCs () {
        let vc1 = HJNavigationController(rootViewController: HomeVC())
        let vc2 = HJNavigationController(rootViewController: ClassifyVC())
        let vc3 = HJNavigationController(rootViewController: MessageVC())
        let vc4 = HJNavigationController(rootViewController: MineVC())
        let vcs = [vc1, vc2, vc3, vc4]
        let titles = ["首页", "分类", "消息", "我的"]
        let normalImages = ["tab_home", "tab_classify", "tab_message", "tab_mine"]
        let selectImages = ["tab_home_focused", "tab_classify_focused", "tab_message_focused", "tab_mine_focused"]
        for index in 0...3 {
            let contentView = HJBouncesContentView()
            contentView.renderingMode = .alwaysOriginal
            let tabBarItem = ESTabBarItem(contentView, title: titles[index], image: UIImage(named: normalImages[index]), selectedImage: UIImage(named: selectImages[index]), tag: index);
            vcs[index].tabBarItem = tabBarItem
        }
        
        viewControllers = vcs
    }
}
