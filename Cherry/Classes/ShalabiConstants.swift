//
//  ShalabiConstants.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/26/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire

struct Sessions {
    static let `default` = normalSession
        
    static let normalSession: SessionManager = {
        return SessionManager.default
    }()
}

#if canImport(ResponseDetective)
extension Sessions {
    static let responseDetectiveSession: SessionManager = {
        let configuration = URLSessionConfiguration.default
        ResponseDetective.enable(inConfiguration: configuration)
        return SessionManager(configuration: configuration)
    }()
}
#endif
