//
//  UIView.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

extension UIView {
    func applyShadow( color: UIColor = .black, offset: CGSize = CGSize(width: 0, height: 3), opacity: Float = 0.4, radius: CGFloat = 5.0) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}
