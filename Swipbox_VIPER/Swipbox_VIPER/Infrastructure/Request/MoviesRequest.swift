//
//  MoviesRequest.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

struct MoviesRequest: DataRequest {
    // MARK: - Variables
    let page: String
    
    //MARK: - Init Method
    init(page: String) {
        self.page = page
    }
    
    var url: String {
        let baseURL = AppConfiguration.shared.apiBaseURL
        return baseURL + "/movie/popular"
    }
    
    let method: HTTPMethod = .get
    
    var queryItems: [String: String] {
        ["page": page]
    }
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        let response = try decoder.decode(MoviesAPIResponse.self, from: data)
        return response.results
    }
}
