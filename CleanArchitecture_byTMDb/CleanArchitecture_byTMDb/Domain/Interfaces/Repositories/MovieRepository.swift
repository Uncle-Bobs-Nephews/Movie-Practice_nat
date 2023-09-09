//
//  MovieRepository.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/09.
//

import Foundation

protocol MoviesRepository {
	@discardableResult
	func fetchMoviesList(
		query: MovieQuery,
		page: Int,
		cached: @escaping (MoviesPage) -> Void,
		completion: @escaping (Result<MoviesPage, Error>) -> Void
	) -> Cancellable?
}
