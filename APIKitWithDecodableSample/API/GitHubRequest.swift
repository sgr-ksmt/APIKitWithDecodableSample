//
//  GitHubRequest.swift
//  APIKitWithDecodableSample
//
//  Created by SuguruKishimoto on 6/19/17.
//  Copyright © 2017 SuguruKishimoto. All rights reserved.
//

import Foundation
import APIKit

protocol GitHubRequest: Request where Response: Decodable {
    var decoder: JSONDecoder { get }
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    var decoder: JSONDecoder {
        return JSONDecoder()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try decoder.decode(Response.self, from: data)
    }
}

extension GitHubRequest where Response: CustomDecodingStrategy {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        let strategies = Response.decodingStrategies
        decoder.dateDecodingStrategy = strategies.dateDecodingStrategy
        decoder.dataDecodingStrategy = strategies.dataDecodingStrategy
        decoder.nonConformingFloatDecodingStrategy = strategies.nonConformingFloatDecodingStrategy
        return decoder
    }
}
