//
//  UIView+extention.swift
//  CatStaGram
//
//  Created by sujin on 2022/11/26.
//

import UIKit

// 코너 래디우스 메소드
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


