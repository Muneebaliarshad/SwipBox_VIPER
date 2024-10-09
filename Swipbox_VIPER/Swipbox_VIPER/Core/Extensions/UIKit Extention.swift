//
//  UIKit Extention.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

extension UIScreen {
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var screenDiagonal: CGFloat {
        return sqrt(screenWidth * screenWidth + screenHeight * screenHeight)
    }
}


//MARK: - UIView
extension UIView {
    func applyShadow( color: UIColor = .black, offset: CGSize = CGSize(width: 0, height: 3), opacity: Float = 0.4, radius: CGFloat = 5.0) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}
