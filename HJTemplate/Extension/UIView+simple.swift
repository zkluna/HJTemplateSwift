//
//  UIView+simple.swift
//  HJTemplate
//
//  Created by zl on 2020/11/9.
//

import UIKit
import Foundation

extension UIView {
    // 裁剪View圆角
    func clipRestCorner(direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    // x
    var hj_x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    // y
    var hj_y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    // height
    var hj_height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    // width
    var hj_width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    // size
    var hj_size: CGSize {
        get { return frame.size }
        set(newValue) {
            var temp = frame
            temp.size = newValue
            frame = temp
        }
    }
    // centerX
    var hj_centerX: CGFloat {
        get { return center.x }
        set(newValue) {
            var temp = center
            temp.x = newValue
            center = temp
        }
    }
    // centerY
    var hj_centerY: CGFloat {
        get { return center.y }
        set(newValue) {
            var temp = center
            temp.y = newValue
            center = temp
        }
    }
}
