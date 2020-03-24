//
//  ParametersConvertable.swift
//  Shalabi
//
//  Created by Hussein AlRyalat on 2/21/20.
//  Copyright © 2020 Hussein AlRyalat. All rights reserved.
//

import Foundation

public protocol ParametersConvertable {
    
    var parameters: [String: Any] { get }
    
    var exludedParametersKeyPaths: [PartialKeyPath<Self>] { get }
}

public extension ParametersConvertable {
    private subscript(checkedMirrorDescendant key: String) -> Any {
        return Mirror(reflecting: self).descendant(key)!
    }
    
    var allKeyPaths: [String: PartialKeyPath<Self>] {
        var membersTokeyPaths = [String: PartialKeyPath<Self>]()
        let mirror = Mirror(reflecting: self)
        for case (let key?, _) in mirror.children {
            membersTokeyPaths[key] = \Self.[checkedMirrorDescendant: key] as PartialKeyPath
        }
        return membersTokeyPaths
    }
    
//    var parameters: [String: Any] {
//        let afterFilter = allKeyPaths.filter { item in
//            !self.exludedParametersKeyPaths.contains(item.value)
//        }.compactMapValues { i in
//            if case Optional<Any>.some(let value) = self[keyPath: i]{
//                return value
//            } else {
//                return nil
//            }
//        }
//
//        return afterFilter
//    }
    
    var parameters: [String: Any] {
        let reflection = Mirror(reflecting: self)

        let values = reflection.children
        var valuesArray = [String: Any]()
        for case let item in values where item.label != nil {
            if case Optional<Any>.some(let value) = item.value {
                valuesArray[item.label!] = value
            }
        }

        return valuesArray
    }
    
    var exludedParametersKeyPaths: [PartialKeyPath<Self>] {
        []
    }
}
