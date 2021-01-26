//
//  HJBaseVC.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/18.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit
import ZKProgressHUD

class HJBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = HJBgColor()
        setUpBackBtnItem()
    }
    // 自定义返回按钮
    func setUpBackBtnItem() {
        if navigationController!.viewControllers.count > 1 {
            let baseBackBtnItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(backAction))
            navigationItem.leftBarButtonItem = baseBackBtnItem
        } else {
            navigationItem.leftBarButtonItem = nil;
        }
    }
    // Back Action
    @objc func backAction() {
       navigationController?.popViewController(animated: true)
    }
    func setRightTitle(title: String) {
        let barItem = UIBarButtonItem(title: title, style: .plain, target: self, action:#selector(rightItemAction(sender:)))
        navigationController?.navigationItem.rightBarButtonItem = barItem
    }
    func setRightImage(imageName: String) {
        let barItem = UIBarButtonItem(image: UIImage(named: imageName), style: .plain, target: self, action: #selector(rightItemAction(sender:)))
        navigationController?.navigationItem.rightBarButtonItem = barItem
    }
    @objc func rightItemAction(sender: UIBarButtonItem) {
        
    }
}
