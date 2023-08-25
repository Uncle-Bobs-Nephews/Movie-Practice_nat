//
//  MovieDiscover.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/08/25.
//

import Foundation

struct MovieDiscover: Equatable, Identifiable {
	typealias Identifier = Int
	
//	let adult: Bool?
//	let backdropPath: String?
//	let genreIds: [Int]?
	let id: Identifier
//	let originalLanguage: String
//	let originalTitle: String
	let overview: String?
//	let popularity: Double?
	let posterPath: String?
	let releaseDate: Date?
	let title: String?
//	let video: Bool?
	let voteAverage: Double?
//	let voteCount: Int?
	
}

struct MoviesPage: Equatable {
	let page: Int
	let totalPages: Int
	let totalResults: Int
	let movieDTO: [MovieDiscover]
}
