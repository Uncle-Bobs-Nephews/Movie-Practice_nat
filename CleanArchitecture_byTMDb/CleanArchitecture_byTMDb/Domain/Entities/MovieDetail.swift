//
//  Movie.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/09.
//

import Foundation

struct MovieDetail: Equatable, Identifiable {
	typealias Identifier = String
	enum Genre {
		case adventure
		case scienceFiction
	}
	let id: Identifier
	let title: String?
	let genre: Genre?
	let posterPath: String?
	let overview: String?
	let releaseDate: Date?
}

struct MoviesPage: Equatable {
	let page: Int
	let totalPages: Int
	let movies: [MovieDetail]
}
