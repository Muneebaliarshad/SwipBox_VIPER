//
//  UIScreen.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 10/10/2024.
//

import Foundation
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
