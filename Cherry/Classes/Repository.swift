//
//  Repository.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

public protocol RepositoryType {
    
    associatedtype ErrorType: Error & Codable
    
    /// The name of repository
    var name: String { get }
    
    /// Each repository has it's based URL, which used for routes defined
    var baseURL: URL { get }
    
    /// Any Middlewares
    var middlewares: [RequestMiddlewareType] { get }
    
    /// Represents "Active" repository, which is the default used in requests
    static var current: Self { get }
    
}


