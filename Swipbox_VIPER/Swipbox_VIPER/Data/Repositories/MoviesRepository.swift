//
//  MoviesRepository.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

class BaseRepositry {
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()
}

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies(pageNumber: Int, completion: @escaping ([Movie]?, ErrorResponse?) -> Void)
}

final class MoviesRepository: BaseRepositry, MoviesRepositoryProtocol {
    
    func fetchMovies(pageNumber: Int, completion: @escaping ([Movie]?, ErrorResponse?) -> Void) {
        if !Reachability.isConnectedToNetwork() {
            completion(nil, ErrorResponse.noInternetConnection)
        } else {
            self.fetchMoviesDataInternet(pageNumber: pageNumber) { result in
                switch result {
                case .success(let moviesDetails):
                    completion(moviesDetails, nil)
                case .failure(let error):
                    completion(nil, ErrorResponse.serializationError(error))
                }
            }
        }
    }
    
    
    private func fetchMoviesDataInternet(pageNumber: Int, complete completion: @escaping (Result<[Movie], Error>) -> Void) {
        networkService.request(MoviesRequest(page: pageNumber.description)) { result in
            switch result {
            case .success(let movieDetails):
                completion(.success(movieDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
