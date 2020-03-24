//
//  RequestMiddleware.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

/**
 A Request middleware acts like a plugin for the network request, and can even modify the the given request ( as the final output )
 */
public protocol RequestMiddlewareType {
    
    /**
     Called at the initialization time for the URLRequest, just when the clients asks to send the request, any modification to the request will be applied.
     */
    func prepare<R: NetworkRoute>(for networkRequest: NetworkRequest<R>, with request: inout URLRequest)
    
    /**
     Will Send Request Event, called before the request will be sent.
     */
    func willSend<R: NetworkRoute>(request: NetworkRequest<R>)
    
    
    /**
     Did Recieve Result Event, called after receiving & decoding the result, the error given might be the repository error type or an internal error ( like decoding error )
     */
    func didRecieve<R: NetworkRoute>(response: Result<R.ResponseType, Error>, from: NetworkRequest<R>)
}

public extension RequestMiddlewareType {
    func prepare<R: NetworkRoute>(for networkRequest: NetworkRequest<R>, with request: inout URLRequest){ }
    func willSend<R: NetworkRoute>(request: NetworkRequest<R>){ }
    func didRecieve<R: NetworkRoute>(response: Result<R.ResponseType, Error>, from: NetworkRequest<R>){ }
}
