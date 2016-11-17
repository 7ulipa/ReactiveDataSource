//
//  Renderable.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import Foundation

public protocol Renderable {
    associatedtype Entity
    associatedtype Dimension
    associatedtype Container
    func render(with entity: Entity)
    static func preferredDimension(for entity: Entity, in container: Container) -> Dimension
}
