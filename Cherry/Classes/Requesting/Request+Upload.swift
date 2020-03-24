//
//  Request+Upload.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation
import Alamofire
import Promises

//public extension NetworkRequest {
//    func uploadUsingMultipart(with data: [Data], parameters: [String: Any], name: String, fileName: String, mimeType: String) -> Promise<ResponseType> {
//        let task = Promise<ResponseType>(on: .main) { (fullfill, reject) in
//            let request = try self.asURLRequest()
//            
//            
//            Session.default.upload(multipartFormData: { (multipartFormData) in
//                
//            }, to: request.url!, usingThreshold: UInt64(), method: .post, headers: request.allHTTPHeaderFields, interceptor: nil, fileManager: FileManager.default)
//            
//            
//            Sessions.default.upload(multipartFormData: <#T##MultipartFormData#>, to: <#T##URLConvertible#>, usingThreshold: <#T##UInt64#>, method: <#T##HTTPMethod#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, fileManager: <#T##FileManager#>)
//            
//            Sessions.default.upload(multipartFormData: { (multipartFormData) in
//                for (key,value) in parameters {
//                    multipartFormData.append((value as? String ?? "\(value)").data(using: .utf8)!, withName: key)
//                }
//                
//                
//                for dataItem in data {
//                    multipartFormData.append(dataItem, withName: name, fileName: fileName, mimeType: mimeType)
//                }
//                
//            }, usingThreshold: UInt64(), to: request.url!, method: .post, headers: request.allHTTPHeaderFields) { (encodingResult) in
//                switch encodingResult {
//                case .success(let request, _, _):
//                    request.responseData(queue: .main) { (response) in
//                        self.handle(response: response).then {
//                            fullfill($0)
//                        }.catch {
//                            reject($0)
//                        }
//                    }
//                    break
//                case .failure(let error):
//                    reject(error)
//                    break
//                }
//            }
//        }
//        
//        return perform(task: task)
//    }
//    
//    func uploadUsingMultipart(with data: Data, parameters: [String: Any], name: String = "avatar") -> Promise<ResponseType> {
//        let task = uploadUsingMultipart(with: [data], parameters: parameters, name: name)
//        return self.perform(task: task)
//    }
//}
