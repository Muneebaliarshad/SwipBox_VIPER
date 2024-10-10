//
//  Int.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

extension Int {
    var scaledToScreen: CGFloat {
        let percentage = (CGFloat(self) / ScreenSize.baseDiagonal) * 100
        return UIScreen.screenDiagonal * (percentage / 100)
    }
    
    var widthRatio: CGFloat {
        let ratio = UIScreen.screenWidth / ScreenSize.baseWidth
        return CGFloat(self) * ratio
    }
    
    var heightRatio: CGFloat {
        let ratio = UIScreen.screenHeight / ScreenSize.baseHeight
        return CGFloat(self) * ratio
    }
}
