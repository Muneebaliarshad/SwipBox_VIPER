//
//  SplashViewController.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 04/10/2024.
//

import UIKit

protocol SplashViewProtocol: BaseViewProtocol {
}

class SplashViewController: UIViewController, SplashViewProtocol {
    
    //MARK: - UIElements
    let logoImageView = CustomImageView(imageName: "Logo", contentMode: .scaleAspectFit, accessibilityText: "logoImageView")
    
    
    //MARK: - Variables
    var presenter: SplashPresenterProtocol!
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addElementsToView()
    }
    
    fileprivate func addElementsToView() {
        view.addSubview(logoImageView)
        applyConstraints()
        
        self.logoImageView.transform = self.logoImageView.transform.scaledBy(x: 0.25, y: 0.25)
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseInOut,
                       animations: ({ [self] in
            self.logoImageView.transform = logoImageView.transform.scaledBy(x: 4.0, y: 4.0)
            
        }), completion: { result in
            self.presenter.navigateToMoviesList()
        })
    }
    
    fileprivate func applyConstraints() {
        NSLayoutConstraint.activate([
            
            ///logoImageView
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    //MARK: - SplashViewProtocol
    func showData(_ isShow: Bool) {
    }
}
