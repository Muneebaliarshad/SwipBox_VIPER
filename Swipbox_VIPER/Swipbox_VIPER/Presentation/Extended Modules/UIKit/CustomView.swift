//
//  View.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

class CustomView: UIView {
    
    //MARK: - Init Methods
    required init(backgroundColor: UIColor,
                  cornerRadius: CGFloat = 0.0,
                  borderColor: UIColor? = nil,
                  borderWidth: CGFloat = 0) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configureView(backgroundColor: backgroundColor, cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func configureView(backgroundColor: UIColor,
                               cornerRadius: CGFloat,
                               borderColor: UIColor?,
                               borderWidth: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        if borderWidth > 0, let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
    }
}

