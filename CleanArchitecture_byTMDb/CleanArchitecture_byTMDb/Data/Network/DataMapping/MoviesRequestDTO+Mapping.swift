//
//  MoviesRequestDTO+Mapping.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/09.
//

import Foundation

struct MoviesRequestDTO: Equatable {
	let query: String
	let page: Int
}
