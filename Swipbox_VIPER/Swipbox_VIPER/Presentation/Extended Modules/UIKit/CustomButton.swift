//
//  Button.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 09/10/2024.
//

import UIKit

class CustomButton: UIButton {
    
    // MARK: - Init Methods
    required init(textKey: String!, font: UIFont, backgroundColor: UIColor = .clear, textColor: UIColor = .white, alignment: ContentHorizontalAlignment = .center, cornerRadius: CGFloat = 0.0, imageName: String = "", borderColor: UIColor = .clear, borderWidth: CGFloat = 2.0, isUpperCase: Bool = false) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        let titleText = isUpperCase ? textKey?.uppercased() : textKey ?? "Button"
        setTitle(titleText, for: .normal)
        
        titleLabel?.font = UIFont(name: font.fontName, size: CGFloat(Int(font.pointSize).scaledToScreen))
        
        layer.cornerRadius = cornerRadius.scaledToScreen
        self.backgroundColor = backgroundColor
        setTitleColor(textColor, for: .normal)
        contentHorizontalAlignment = alignment
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth.scaledToScreen
        
        if !imageName.isEmpty, let image = UIImage(named: imageName) {
            setImage(image, for: .normal)
            imageView?.contentMode = .scaleAspectFit
        }
        
        isAccessibilityElement = true
        accessibilityLabel = titleText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
