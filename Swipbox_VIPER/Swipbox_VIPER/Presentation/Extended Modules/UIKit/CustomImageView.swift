//
//  CustomImageView.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 04/10/2024.
//

import UIKit

class CustomImageView: UIImageView {
    
    // MARK: - Init Methods
    required init(imageName: String = "Placeholder",
                  cornerRadius: CGFloat = 0.0,
                  backgroundColor: UIColor = .clear,
                  contentMode: UIView.ContentMode = .scaleAspectFill,
                  accessibilityText: String? = nil) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configureImageView(imageName: imageName, cornerRadius: cornerRadius, backgroundColor: backgroundColor, contentMode: contentMode, accessibilityText: accessibilityText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureImageView(imageName: String,
                                    cornerRadius: CGFloat,
                                    backgroundColor: UIColor,
                                    contentMode: UIView.ContentMode,
                                    accessibilityText: String?) {
        if let loadedImage = UIImage(named: imageName) {
            self.image = loadedImage
        } else {
            self.image = UIImage(named: "Placeholder")
        }
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.clipsToBounds = true
        self.accessibilityIdentifier = accessibilityText ?? imageName
    }
}
