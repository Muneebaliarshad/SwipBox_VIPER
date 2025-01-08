//
//  Spinner.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 09/10/2024.
//

import UIKit

class Spinner: NSObject {
    
    // MARK: - UI Elements
    private let blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let aiView = UIActivityIndicatorView()
        aiView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            aiView.style = .large
        } else {
            aiView.style = .gray
        }
        aiView.color = .systemBackground
        return aiView
    }()
    
    // MARK: - Variables
    static let shared = Spinner()
    
    // MARK: - Helper Methods
    private func setView(on view: UIView) {
        // Prevent redundant view setup
        if blurView.superview != nil {
            return
        }

        // Add views
        view.addSubview(blurView)
        view.addSubview(containerView)
        containerView.addSubview(activityIndicator)
        
        // Activate constraints
        NSLayoutConstraint.activate([
            // blurView
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // containerView
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            containerView.widthAnchor.constraint(equalTo: containerView.heightAnchor),
            
            // activityIndicator
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        // Customize activityIndicator
        activityIndicator.transform = CGAffineTransform(scaleX: CGFloat(1.4).scaledToScreen, y: CGFloat(1.4).scaledToScreen)
        activityIndicator.startAnimating()
    }
    
    // Show Loader
    func showLoader(on view: UIView? = nil) {
        DispatchQueue.main.async {
            if let view = view {
                self.setView(on: view)
            } else if let topController = AlertBuilder.topMostController() {
                self.setView(on: topController.view)
            }
        }
    }
    
    // Remove Loader
    func removeLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.blurView.removeFromSuperview()
            self.containerView.removeFromSuperview()
        }
    }
}
