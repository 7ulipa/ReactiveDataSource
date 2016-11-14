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
    func render(with entity: Entity)
}
