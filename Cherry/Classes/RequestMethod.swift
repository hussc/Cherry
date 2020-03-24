//
//  RequestMethod.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire

public enum RequestMethod: String {
    case get
    case post
    case delete
    case update
}

extension RequestMethod {
    var alamofireMethod: HTTPMethod {
        switch self {
        case .post:
            return .post
        case .get:
            return .get
        case .update:
            return .patch
        case .delete:
            return .delete
        }
    }
}
