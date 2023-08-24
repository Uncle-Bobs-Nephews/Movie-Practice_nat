//
//  HideApiKey++Bundle.swift
//  CleanArchitecture_byTMDb
//
//  Created by Seohyun Kim on 2023/08/25.
//

import Foundation

extension Bundle {
	var apiKey: String {
		guard let file = self.path(forResource: "MovieInfo", ofType: "plist") else { return "" }
		guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
		guard let key = resource["ApiKey"] as? String else { fatalError("MovieInfo.plist에 API_KEY 설정을 해주세요.") }
		return key
	}
}

