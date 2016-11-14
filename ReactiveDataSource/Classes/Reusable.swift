//
//  Reusable.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import Foundation

public protocol Reusable {
    static func reuseIdentifier() -> String
    static func register(for collectionView: UICollectionView)
}

public extension Reusable {
    static func reuseIdentifier() -> String {
        return "\(self)"
    }
}
