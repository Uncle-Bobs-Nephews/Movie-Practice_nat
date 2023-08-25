//
//  File.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/08/25.
//

import Foundation

struct MoviesResponseDTO: Decodable {
	let page: Int
	let totalPages: Int
	let totalResults: Int
	let movieDTO: [MovieDTO]
	
	private enum CodingKeys: String, CodingKey {
		case page
		case totalPages = "total_pages"
		case totalResults = "total_results"
		case movieDTO = "results"
	}
}

extension MoviesResponseDTO {
	struct MovieDTO: Decodable {
		private enum CodingKeys: String, CodingKey {
			case adult
			case backdropPath = "backdrop_path"
			case genreIds = "genre_ids"
			case id
			case originalLanguage = "original_language"
			case originalTitle = "original_title"
			case overview
			case popularity
			case posterPath = "poster_path"
			case releaseDate = "release_date"
			case title
			case video
			case voteAverage = "vote_average"
			case voteCount = "vote_count"
		}
		
		let adult: Bool?
		let backdropPath: String?
		let genreIds: [Int]?
		let id: Int
		let originalLanguage: String
		let originalTitle: String
		let overview: String?
		let popularity: Double?
		let posterPath: String?
		let releaseDate: String?
		let title: String?
		let video: Bool?
		let voteAverage: Double?
		let voteCount: Int?
	}
}

extension MoviesResponseDTO {
	func toDomain() -> MoviesPage {
		return .init(page: page, totalPages: totalPages, totalResults: totalResults, movieDTO:movieDTO.map { $0.toDomain() })
	}
}

extension MoviesResponseDTO.MovieDTO {
	func toDomain() -> MovieDiscover {
		return .init(id: MovieDiscover.Identifier(id), overview: overview, posterPath: posterPath, releaseDate: dateFormatter.date(from: releaseDate ?? ""), title: title, voteAverage: voteAverage)
	}
}

private let dateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "yyyy-MM-dd"
	formatter.calendar = Calendar(identifier: .iso8601)
	formatter.timeZone = TimeZone(secondsFromGMT: 0)
	formatter.locale = Locale(identifier: "en_US_POSIX")
	return formatter
}()
