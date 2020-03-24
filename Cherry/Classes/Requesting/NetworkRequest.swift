//
//  NetworkRequest.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire
import Promises

public class NetworkRequest<R: NetworkRoute>: URLRequestConvertible {
    
    public typealias ResponseType = R.ResponseType
    public typealias ErrorType = R.Repository.ErrorType
    
    public let repository: R.Repository
    public let route: R
    public let middlewares: [RequestMiddlewareType]
    
    public init(repository: R.Repository, route: R, middlewares: [RequestMiddlewareType]){
        self.repository = repository
        self.route = route
        self.middlewares = middlewares
    }

    public func asURLRequest() throws -> URLRequest {
        let baseURL = repository.baseURL
        let url = baseURL.appendingPathComponent(route.path)
        let parameters = route.parameters
        let method = self.route.method
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        middlewares.forEach {
            $0.prepare(for: self, with: &request)
        }
        
        return try self.route.encoding.encode(request, with: parameters)
    }
}


extension NetworkRequest {
    func handle(response: DataResponse<Data>) -> Promise<ResponseType> {
        return Promise<ResponseType>(on: .main){ (fullfill, reject) in
            switch response.result {
            case .failure(let error):
                reject(error)
            case .success(let data):
                do {
                    let decoder = DefaultDataDecoder<ResponseType>()
                    let value = try decoder.decode(from: data)
                    
                    fullfill(value)
                } catch(let parentError){
                   
                    if response.response?.statusCode == 200 {
                        reject(parentError)
                    }
                    
                    // try to decode as API error
                    do {
                        let errorDecoder = DefaultDataDecoder<ErrorType>()
                        let value = try errorDecoder.decode(from: data)
                        
                        reject(value)
                    } catch {
                        reject(parentError)
                    }
                }
            }
        }
    }
    
    func perform(task: Promise<ResponseType>) -> Promise<ResponseType> {
        self.middlewares.forEach {
            $0.willSend(request: self)
        }
        
        return task.then { result in
            self.middlewares.forEach { middleware in
                middleware.didRecieve(response: .success(result), from: self)
            }
        }.catch { error in
            self.middlewares.forEach { middleware in
                middleware.didRecieve(response: .failure(error), from: self)
            }
        }
    }
}



