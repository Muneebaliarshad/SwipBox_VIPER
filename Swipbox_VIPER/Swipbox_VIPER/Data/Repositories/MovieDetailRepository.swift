//
//  MovieDetailRepository.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

protocol MovieDetailRepositoryProtocol: AnyObject {
    func fetchMovieData(movieID: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}

final class MovieDetailRepository: BaseRepositry, MovieDetailRepositoryProtocol {
    
    func fetchMovieData(movieID: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(ErrorResponse.noInternetConnection))
        } else {
            self.fetchMoviesDataInternet(movieID: movieID) { result in
                switch result {
                case .success(let moviesDetails):
                    completion(.success(moviesDetails))
                case .failure(let error):
                    completion(.failure(ErrorResponse.serializationError(error)))
                }
            }
        }
    }
    
    
    private func fetchMoviesDataInternet(movieID: Int, complete completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        networkService.request(MovieDetailRequest(movieID: movieID)) { result in
            switch result {
            case .success(let movieDetails):
                completion(.success(movieDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
