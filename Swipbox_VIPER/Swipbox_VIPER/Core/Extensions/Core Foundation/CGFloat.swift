//
//  CGFloat.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 10/10/2024.
//

import Foundation
import UIKit

extension CGFloat {
    var scaledToScreen: CGFloat {
        let percentage = (self / ScreenSize.baseDiagonal) * 100
        return UIScreen.screenDiagonal * (percentage / 100)
    }
    
    var widthRatio: CGFloat {
        let ratio = UIScreen.screenWidth / ScreenSize.baseWidth
        return self * ratio
    }
    
    var heightRatio: CGFloat {
        let ratio = UIScreen.screenHeight / ScreenSize.baseHeight
        return self * ratio
    }
}
