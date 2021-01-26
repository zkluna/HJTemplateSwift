//
//  HJInputView.swift
//  HJTemplate
//
//  Created by zhaoke on 2020/11/10.
//

import UIKit
import Foundation

protocol HJInputViewDelegate {
    func inputBegin(inputView: HJInputView)
    func inputChange(inputView: HJInputView)
    func inputComplete(inputView: HJInputView)
}
class HJInputView: UIView {
    var passwordLength: Int = 4
    var squareHeight: CGFloat = 60
    var pointRadius: CGFloat = 6
    var pointColor: UIColor = HJTitleColor()
    var rectColor: UIColor = HJContentColor()
    var password: String = ""
    let reNumber = "0.123456789"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HJInputView: UIKeyInput {
    var hasText: Bool {
        <#code#>
    }
    func insertText(_ text: String) {
        <#code#>
    }
    func deleteBackward() {
        <#code#>
    }
}
