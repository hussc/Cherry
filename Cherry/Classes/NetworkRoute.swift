//
//  NetworkRoute.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire

public protocol NetworkRoute: ParametersConvertable {
    
    associatedtype ResponseType: Codable
    associatedtype Repository: RepositoryType
    
    /// How the data encoded in the request?
    var encoding: ParameterEncoding { get }
        
    /// The path of the route, appended to the baseURL of the repository
    var path: String { get }
    
    /// The type ( method ) of the route, a get route or a post?
    var method: RequestMethod { get }
}

public extension NetworkRoute {
    var encoding: ParameterEncoding {
        if method == .get {
            return URLEncoding.queryString
        } else {
            return JSONEncoding.default
        }
    }
}


public extension NetworkRoute {
    func request(in repository: Self.Repository = .current, with middlewares: [RequestMiddlewareType] = Repository.current.middlewares) -> NetworkRequest<Self> {
        return .init(repository: repository, route: self, middlewares: middlewares)
    }
}
