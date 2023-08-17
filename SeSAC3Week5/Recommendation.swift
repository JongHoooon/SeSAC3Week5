//
//  Recommendation.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/17.
//

import Foundation

// MARK: - VideoListResponse
struct Recommendation: Codable {
    let totalResults, page, totalPages: Int?
    let results: [Movie]?

    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Movie: Codable {
    let originalTitle, overview, releaseDate: String?
    let voteCount: Int?
    let mediaType: String?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let genreIDS: [Int]?
    let adult: Bool?
    let title: String?
    let voteAverage: Double?
    let backdropPath: String?
    let originalLanguage: String?
    let popularity: Double?

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case mediaType = "media_type"
        case video
        case posterPath = "poster_path"
        case id
        case genreIDS = "genre_ids"
        case adult, title
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case popularity
    }
}
