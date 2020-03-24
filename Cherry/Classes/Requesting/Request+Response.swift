//
//  Request+NormalResponse.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire
import Promises

public extension NetworkRequest {
    func responseDecodable() -> Promise<ResponseType> {
        let task = Promise<ResponseType>(on: .main) { (fullfill, reject) in
            Sessions.default.request(self).responseData { (response) in
                self.handle(response: response).then {
                    fullfill($0)
                }.catch {
                    reject($0)
                }
            }
        }
        
        return perform(task: task)
    }
}
