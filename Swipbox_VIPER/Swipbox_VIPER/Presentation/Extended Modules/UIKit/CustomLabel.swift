//
//  CustomLabel.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

class CustomLabel: UILabel {
    
    // MARK: - Init Methods
    required init(text: String,
                  textColor: UIColor = .black,
                  font: UIFont = .systemFont(ofSize: 14),
                  alignment: NSTextAlignment = .natural,
                  numberOfLines: Int = 1) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configureLabel(text: text, textColor: textColor, font: font, alignment: alignment, numberOfLines: numberOfLines)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureLabel(text: String,
                                textColor: UIColor,
                                font: UIFont,
                                alignment: NSTextAlignment,
                                numberOfLines: Int) {
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        
        // Handle font scaling and safely unwrap the font
        if let scaledFont = UIFont(name: font.fontName, size: font.pointSize.scaledToScreen) {
            self.font = scaledFont
        } else {
            self.font = .systemFont(ofSize: font.pointSize.scaledToScreen)
        }
    }
}
