//
//  MovieDetailRepository.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

protocol MovieDetailRepositoryProtocol: AnyObject {
    func fetchMovieData(movieID: Int, completion: @escaping (MovieDetail?, ErrorResponse?) -> Void)
}

final class MovieDetailRepository: BaseRepositry, MovieDetailRepositoryProtocol {
    
    func fetchMovieData(movieID: Int, completion: @escaping (MovieDetail?, ErrorResponse?) -> Void) {
        if !Reachability.isConnectedToNetwork() {
            completion(nil, ErrorResponse.noInternetConnection)
        } else {
            self.fetchMoviesDataInternet(movieID: movieID) { result in
                switch result {
                case .success(let moviesDetails):
                    completion(moviesDetails, nil)
                case .failure(let error):
                    completion(nil, ErrorResponse.serializationError(error))
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
