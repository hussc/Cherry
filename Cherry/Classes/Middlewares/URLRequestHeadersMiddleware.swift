//
//  URLRequestHeadersMiddleware.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

public struct URLRequestHeadersMiddleware: RequestMiddlewareType {

    public var headers: [String: String]
    
    public init(headers: [String: String]){
        self.headers = headers
    }
    
    public func prepare<R>(for networkRequest: NetworkRequest<R>, with request: inout URLRequest) where R : NetworkRoute {
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
