//
//  MovieDetailRequest.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

struct MovieDetailRequest: DataRequest {
    var movieID: Int
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    var url: String {
        let baseURL = AppConfiguration.shared.apiBaseURL
        return baseURL + "/movie/\(movieID)"
    }
    
    var method: HTTPMethod = .get
    
    var queryItems: [String : String] {
        return [:]
    }
    
    func decode(_ data: Data) throws -> MovieDetail {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        let response = try decoder.decode(MovieDetail.self, from: data)
        return response
    }
}
