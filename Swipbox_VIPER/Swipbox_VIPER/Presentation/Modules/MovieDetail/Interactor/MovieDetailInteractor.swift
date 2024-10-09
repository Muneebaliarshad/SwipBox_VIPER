//
//  MovieDetailInteractor.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol MovieDetailInteractorProtocol: AnyObject {
    func getItemDetail()
}

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var presenter: MovieDetailPresenterProtocol?
    var repositry: MovieDetailRepositoryProtocol?
    var movieID: Int?
    
    init(presenter: MovieDetailPresenterProtocol? = nil, repositry: MovieDetailRepositoryProtocol, movieID: Int?) {
        self.presenter = presenter
        self.repositry = repositry
        self.movieID = movieID
    }
    
    func getItemDetail() {
        repositry?.fetchMovieData(movieID: movieID ?? 0, completion: { data, error in
            self.presenter?.didFetchItemDetail(data, error: error)
        })
    }
}
