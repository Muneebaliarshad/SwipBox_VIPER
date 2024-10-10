//
//  MovieDetailPresenter.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didFetchItemDetail(_ movieData: MovieDetail?, error: ErrorResponse?)
    var movieData: MovieDetail? { get set }
}

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var movieData: MovieDetail?

    init(view: MovieDetailViewProtocol? = nil, interactor: MovieDetailInteractorProtocol? = nil, movieData: MovieDetail? = nil) {
        self.view = view
        self.interactor = interactor
        self.movieData = movieData
    }
    
    func viewDidLoad() {
        Spinner.shared.showLoader()
        interactor?.getItemDetail()
    }

    func didFetchItemDetail(_ movieData: MovieDetail?, error: ErrorResponse?) {
        Spinner.shared.removeLoader()
        guard let error = error else {
            self.movieData = movieData
            view?.showData(true)
            return
        }
        AlertBuilder.showErrorAlert(message: error.description)
        view?.showData(false)
    }
}
