//
//  ShalabiConstants.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/26/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire

public struct Sessions {
    static var `default` = normalSession
        
    public static let normalSession: Session = {
        return Session.default
    }()
    
    public static func use(session: Session){
        self.default = session
    }
}

#if canImport(ResponseDetective)
public extension Sessions {
    public static let responseDetectiveSession: Session = {
        let configuration = URLSessionConfiguration.default
        ResponseDetective.enable(inConfiguration: configuration)
        return Session(configuration: configuration)
    }()
}
#endif
