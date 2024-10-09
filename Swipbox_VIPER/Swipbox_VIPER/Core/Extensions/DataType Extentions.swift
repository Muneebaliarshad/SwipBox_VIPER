//
//  DataType Extentions.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

// Constants for device dimensions (example: iPhone 12)
private struct ScreenSize {
    static let baseWidth: CGFloat = 390
    static let baseHeight: CGFloat = 844
    static let baseDiagonal: CGFloat = 877
}

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


///----------  Int   -----------
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
