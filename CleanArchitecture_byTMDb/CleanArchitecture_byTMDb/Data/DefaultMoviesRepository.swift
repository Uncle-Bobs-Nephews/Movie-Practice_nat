//
//  DefaultMoviesRepository.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/09/10.
//

import Foundation

final class DefaultMoviesRepository {
	private let dataTransferService: DataTransferService
	private let cache: MoviesResponseStorage
	private let backgroundQueue: DataTransferDispatchQueue
	
	init(dataTransferService: DataTransferService, cache: MoviesResponseStorage, backgroundQueue: DataTransferDispatchQueue) {
		self.dataTransferService = dataTransferService
		self.cache = cache
		self.backgroundQueue = backgroundQueue
	}
}
