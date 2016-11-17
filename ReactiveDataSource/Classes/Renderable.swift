//
//  Renderable.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import Foundation

public protocol Renderable: NSObjectProtocol {
    associatedtype Entity
    func render(with entity: Entity)
}
