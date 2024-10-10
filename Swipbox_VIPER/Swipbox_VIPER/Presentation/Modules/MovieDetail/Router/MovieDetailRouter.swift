//
//  MovieDetailRouter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

protocol DetailRouterProtocol: AnyObject {}

class DetailRouter: DetailRouterProtocol {
    static func createDetailModule(with movieID: Int) -> UIViewController {
        let viewController = MovieDetailViewController()
        let interactor = MovieDetailInteractor(repositry: MovieDetailRepository(), movieID: movieID)
        let presenter = MovieDetailPresenter(view: viewController, interactor: interactor)
        _ = DetailRouter()

        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
