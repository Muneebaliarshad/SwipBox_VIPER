//
//  MoviesListPresenter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol MoviesListPresenterProtocol: BasePresenterProtocol {
    var moviesData: [Movie] { get set }
    func navigateToMovieDetail(index: Int)
}

class MoviesListPresenter: MoviesListPresenterProtocol, MoviesListInteractorOutputProtocol {
    private weak var view: MoviesListViewProtocol?
    private var interactor: MoviesListInteractorProtocol?
    private var router: MoviesListRouterProtocol?
    var moviesData: [Movie] = []
    
    init(view: MoviesListViewProtocol?, interactor: MoviesListInteractorProtocol?, router: MoviesListRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        Spinner.shared.showLoader()
        interactor?.fetchItems()
    }
    
    func navigateToMovieDetail(index: Int) {
        let movieData = moviesData[index]
        router?.navigateToDetailScreen(from: view!, with: movieData.id)
    }

    // MARK: - MoviesListInteractorOutputProtocol
    func didFetchItems(_ moviesData: [Movie]?, error: ErrorResponse?) {
        Spinner.shared.removeLoader()
        guard let error = error else {
            self.moviesData = moviesData ?? []
            view?.showData(true)
            return
        }
        AlertBuilder.showErrorAlert(message: error.description)
        view?.showData(false)
    }
}
