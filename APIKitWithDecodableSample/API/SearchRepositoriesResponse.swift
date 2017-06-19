//
//  SearchRepositoriesResponse.swift
//  APIKitWithDecodableSample
//
//  Created by SuguruKishimoto on 6/19/17.
//  Copyright © 2017 SuguruKishimoto. All rights reserved.
//

import Foundation

struct SearchRepositoriesResponse: Decodable, CustomDecodingStrategy {
    let items: [Repository]
    
    static var decodingStrategies: Strategies {
        return Repository.decodingStrategies
    }
}
