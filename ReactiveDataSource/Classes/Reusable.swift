//
//  Reusable.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import Foundation

public protocol Reusable {
    associatedtype Container
    static func reuseIdentifier() -> String
    static func register(for container: Container)
}

public extension Reusable {
    static func reuseIdentifier() -> String {
        return "\(self)"
    }
}
