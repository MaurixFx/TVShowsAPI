//
//  TVShow.swift
//  
//
//  Created by Mauricio Figueroa on 03-11-23.
//

import Foundation

struct TVShowResponse: Decodable {
    let results: [TVShow]
}

struct TVShow: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let originalLanguage: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    
    var imageURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
    }
}
