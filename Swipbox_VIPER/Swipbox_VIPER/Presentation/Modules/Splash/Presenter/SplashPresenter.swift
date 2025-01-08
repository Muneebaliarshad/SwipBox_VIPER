//
//  SplashPresenter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func navigateToMoviesList()
}

class SplashPresenter: SplashPresenterProtocol {
    weak var view: SplashViewProtocol?
    var router: SplashRouter?
    
    init(view: SplashViewProtocol? = nil, router: SplashRouter? = nil) {
        self.view = view
        self.router = router
    }
    
    func navigateToMoviesList() {
        router?.navigateToMovieListScreen(from: view!)
    }
}
