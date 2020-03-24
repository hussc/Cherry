//
//  ErrorTracerMiddleware.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/26/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

public class ErrorTracerMiddleware: RequestMiddlewareType {
    
    public init(){ }
    
    public func didRecieve<R>(response: Result<R.ResponseType, Error>, from: NetworkRequest<R>) where R : NetworkRoute {
        
        if case .failure(let error) = response {
            print("*** ERROR TRACER: GOT ERROR for \(from.route.path)")
            print("\(error)")
        }
    }
}
