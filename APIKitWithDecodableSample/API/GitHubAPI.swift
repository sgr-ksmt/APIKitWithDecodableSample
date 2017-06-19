//
//  GitHubAPI.swift
//  APIKitWithDecodableSample
//
//  Created by SuguruKishimoto on 6/19/17.
//  Copyright © 2017 SuguruKishimoto. All rights reserved.
//

import Foundation
import APIKit

final class GitHubAPI {
    private init() {}
    
    struct SearchRepositories: GitHubRequest {
        typealias Response = SearchRepositoriesResponse
        
        let method: HTTPMethod = .get
        let path: String = "/search/repositories"
        var parameters: Any? {
            return ["q": query, "page": 1]
        }
        
        let query: String
    }
}
