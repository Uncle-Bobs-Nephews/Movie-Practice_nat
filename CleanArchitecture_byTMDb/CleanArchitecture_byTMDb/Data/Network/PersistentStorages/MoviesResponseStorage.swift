//
//  MoviesResponseStorage.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/10.
//

import Foundation

protocol MoviesResponseStorage {
	func getResponse(
		for request: MoviesRequestDTO,
		completion: @escaping (Result<MoviesQueryResponseDTO?, Error>) -> Void
	)
	func save(response: MoviesQueryResponseDTO, for requestDTO: MoviesRequestDTO)
}
