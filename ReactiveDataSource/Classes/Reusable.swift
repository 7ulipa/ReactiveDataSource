//
//  Reusable.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import Foundation

public protocol Reusable {
    associatedtype reuseContainerType
    static func reuseIdentifier() -> String
    static func register(for container: reuseContainerType)
}

public extension Reusable {
    static func reuseIdentifier() -> String {
        return "\(self)"
    }
}
