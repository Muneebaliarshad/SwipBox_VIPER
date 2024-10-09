//
//  MoviesListRouter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation
import UIKit

protocol MoviesListRouterProtocol: AnyObject {
    func navigateToDetailScreen(from view: MoviesListViewProtocol, with movieID: Int)
}

class MoviesListRouter: MoviesListRouterProtocol {
    static func createMoviesListModule() -> UIViewController {
        let viewController = MoviesListViewController()
        let interactor = MoviesListInteractor(repositry: MoviesRepository())
        let router = MoviesListRouter()
        let presenter = MoviesListPresenter(view: viewController,
                                            interactor:interactor,
                                            router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }

    func navigateToDetailScreen(from view: MoviesListViewProtocol, with movieID: Int) {
        let detailVC = DetailRouter.createDetailModule(with: movieID)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
