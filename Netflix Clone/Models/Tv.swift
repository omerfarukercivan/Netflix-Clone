//
//  Tv.swift
//  Netflix Clone
//
//  Created by Ömer Faruk Ercivan on 22.05.2023.
//

import Foundation

struct TrendingTvResponse: Codable {
    let results: [Tv]
}

struct Tv: Codable {
    let id: Int
    let mediaType: String?
    let originalName: String?
    let posterPath: String?
    let overview: String?
    let voteCount: Int
    let releaseDate: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case mediaType = "media_type"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
