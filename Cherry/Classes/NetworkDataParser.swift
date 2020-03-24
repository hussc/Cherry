//
//  NetworkDataParser.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

protocol DataDecoderType {
    associatedtype ResultType
    
    func decode(from data: Data) throws -> ResultType
}

public struct DefaultDataDecoder<ResultType: Codable>: DataDecoderType {
    
    let decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = .init()){
        self.decoder = decoder
    }
    
    public func decode(from data: Data) throws -> ResultType {
        return try self.decoder.decode(ResultType.self, from: data)
    }
}
