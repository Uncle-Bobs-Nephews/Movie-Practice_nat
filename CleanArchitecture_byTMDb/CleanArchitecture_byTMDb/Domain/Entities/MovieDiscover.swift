//
//  MovieDiscover.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/08/25.
//

import Foundation

struct MovieDiscover: Equatable, Identifiable {
	typealias Identifier = Int
	
	let id: Identifier
	let overview: String?
	let posterPath: String?
	let releaseDate: Date?
	let title: String?
	let voteAverage: Double?

}

struct MoviesDiscoverPage: Equatable {
	let page: Int
	let totalPages: Int
	let totalResults: Int
	let movieDTO: [MovieDiscover]
}
