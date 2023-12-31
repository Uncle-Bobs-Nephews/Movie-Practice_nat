//
//  APIEndpoints.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/08/26.
//

import Foundation

struct APIEndpoints {
	static func getMovies(with moviesRequestDTO: MoviesRequestDTO) -> Endpoint<MoviesQueryResponseDTO> {
		return Endpoint(
			 path: "3/search/movie",
			 method: .get,
			 queryParametersEncodable: moviesRequestDTO
		)
	}
	
	static func getMoviePoster(path: String, width: Int) -> Endpoint<Data> {
		let sizes = [92, 154, 185, 342, 500, 780]
		let closestWidth = sizes
			.enumerated()
		//`abs()` Returns the absolute value of the given number.
			.min { abs($0.1 - width) < abs($1.1 - width) }?
			.element ?? sizes.first!
		
		return Endpoint(path: "/t/p/w\(closestWidth)\(path)",
							 method: .get,
							 responseDecoder: RawDataResponseDecoder())
	}
}
