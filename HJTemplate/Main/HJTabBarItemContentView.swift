//
//  HJTabBarItemContentView.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/20.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import UIKit
import ESTabBarController_swift

class HJTabBarItemContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = HJDescriptionColor()
        highlightTextColor = HJPrimaryColor()
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class HJBouncesContentView: HJTabBarItemContentView {
    public var duration = 0.3
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0,1.1,1.2,1.3,1.4,1.3,1.2,1.1,1.0]
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}
