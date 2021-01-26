//
//  HJColor.swift
//  HJTemplate
//
//  Created by zl on 2020/11/9.
//

import UIKit
import Foundation
import Hue

// RGBA的颜色设置
func HJColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func HJColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}
// 背景灰
func HJBgColor() -> UIColor {
    return UIColor(hex: "#F9F9F9")
}
// 主题绿色
func HJPrimaryColor() -> UIColor {
    return UIColor(hex: "#43BC83")
}
// 分割线
func HJDividerColor() -> UIColor {
    return UIColor(hex: "#F5F5F5")
}
// 高亮绿色
func HJHightGreenColor() -> UIColor {
    return UIColor(hex: "#2E7A4D")
}
// 不可点击颜色
func HJDisableGreenColor() -> UIColor {
    return UIColor(hex: "#9BE6BF")
}

// 标题文字颜色
func HJTitleColor() -> UIColor {
    return UIColor(hex: "#333333")
}
// 正文文字颜色
func HJContentColor() -> UIColor {
    return UIColor(hex: "#666666")
}
// 描述文字颜色
func HJDescriptionColor() -> UIColor {
    return UIColor(hex: "#999999")
}
// 轻文字颜色
func HJLightTextColor() -> UIColor {
    return UIColor(hex: "#C9C9C9")
}

func HJBlueColor() -> UIColor {
    return UIColor(hex: "#388FF4")
}
func HJOrangeColor() -> UIColor {
    return UIColor(hex: "#E76A1A")
}
func HJRedColor() -> UIColor {
    return UIColor(hex: "#FF3931")
}
func HJYellowColor() -> UIColor {
    return UIColor(hex: "#FFB31A")
}
