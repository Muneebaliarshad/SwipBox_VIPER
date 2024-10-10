//
//  SplashRouter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation
import UIKit

protocol SplashRouterProtocol: AnyObject {
}

class SplashRouter: SplashRouterProtocol {
    static func createSplashModule() -> UIViewController {
        let viewController = SplashViewController()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: viewController,
                                        router: router)
        viewController.presenter = presenter
    
        return viewController
    }
    
    static func setSplashScreen(from window: UIWindow) {
        let splashVC = SplashRouter.createSplashModule()
        window.rootViewController = splashVC
    }
    
    func navigateToMovieListScreen(from view: SplashViewProtocol) {
        let moviesListVC = MoviesListRouter.createMoviesListModule()
        let moviesListNavigation = UINavigationController(rootViewController: moviesListVC)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = moviesListNavigation
            }
        }
    }
}
