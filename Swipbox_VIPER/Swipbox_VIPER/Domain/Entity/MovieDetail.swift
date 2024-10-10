//
//  MovieDetail.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 08/10/2024.
//

import Foundation

struct MovieDetail: Codable, Equatable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let releaseDate: String?
    let budget: Double?
    let overview: String?
    let revenue: Double?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case budget
        case overview
        case revenue
        case voteAverage = "vote_average"
    }
    
}
