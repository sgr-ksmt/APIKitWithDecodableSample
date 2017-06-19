//
//  CustomDecodingStrategy.swift
//  APIKitWithDecodableSample
//
//  Created by SuguruKishimoto on 6/19/17.
//  Copyright © 2017 SuguruKishimoto. All rights reserved.
//

import Foundation

protocol CustomDecodingStrategy {
    typealias Strategies = (
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy
    )
    static var decodingStrategies: (Strategies) { get }
}
