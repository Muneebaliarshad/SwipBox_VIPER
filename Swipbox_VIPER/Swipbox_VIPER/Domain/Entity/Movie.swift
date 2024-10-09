//
//  Movie.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

struct MoviesAPIResponse: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

