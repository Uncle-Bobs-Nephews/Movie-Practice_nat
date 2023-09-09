//
//  MoviesQueryResponseDTO+Mapping.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/09.
//

import Foundation

struct MoviesQueryResponseDTO: Decodable {
	private enum CodingKeys: String, CodingKey {
		case page
		case totalPages = "total_pages"
		case movies = "results"
	}
	
	let page: Int
	let totalPages: Int
	let movies: [MovieDTO]
}

extension MoviesQueryResponseDTO {
	struct MovieDTO: Decodable {
		 private enum CodingKeys: String, CodingKey {
			  case id
			  case title
			  case genre
			  case posterPath = "poster_path"
			  case overview
			  case releaseDate = "release_date"
		 }
		 enum GenreDTO: String, Decodable {
			  case adventure
			  case scienceFiction = "science_fiction"
		 }
		 let id: Int
		 let title: String?
		 let genre: GenreDTO?
		 let posterPath: String?
		 let overview: String?
		 let releaseDate: String?
	}
}

extension MoviesQueryResponseDTO {
	func toDomain()  -> MoviesPage {
		return .init(page: page,
								 totalPages: totalPages,
								 movies: movies.map { $0.toDomain() })
	}
}

extension MoviesQueryResponseDTO.MovieDTO {
	func toDomain() -> MovieDetail {
		return .init(id: MovieDetail.Identifier(id),
								 title: title,
								 genre: genre?.toDomain(),
								 posterPath: posterPath,
								 overview: overview,
								 releaseDate: dateFormatter.date(from: releaseDate ?? ""))
	}
}

extension MoviesQueryResponseDTO.MovieDTO.GenreDTO {
		func toDomain() -> MovieDetail.Genre {
				switch self {
				case .adventure: return .adventure
				case .scienceFiction: return .scienceFiction
				}
		}
}

//MARK: - Private
private let dateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "yyyy-MM-dd"
	formatter.calendar = Calendar(identifier: .iso8601)
	formatter.timeZone = TimeZone(secondsFromGMT: 0)
	formatter.locale = Locale(identifier: "en_US_POSIX")
	return formatter
}()
