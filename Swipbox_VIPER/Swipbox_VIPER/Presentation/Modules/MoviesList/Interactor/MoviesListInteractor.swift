//
//  MoviesListInteractor.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol MoviesListInteractorProtocol: AnyObject {
    func fetchItems()
}

protocol MoviesListInteractorOutputProtocol: AnyObject {
    func didFetchItems(_ moviesData: [Movie]?, error: ErrorResponse?)
}

class MoviesListInteractor: MoviesListInteractorProtocol {
    var presenter: MoviesListInteractorOutputProtocol?
    var repositry: MoviesRepositoryProtocol?
    
    init(presenter: MoviesListInteractorOutputProtocol? = nil, repositry: MoviesRepositoryProtocol) {
        self.presenter = presenter
        self.repositry = repositry
    }
    
    func fetchItems() {
        repositry?.fetchMovies(pageNumber: 0, completion: { movies, error in
            self.presenter?.didFetchItems(movies, error: error)
        })
    }
}
