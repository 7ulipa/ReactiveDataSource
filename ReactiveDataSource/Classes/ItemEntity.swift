//
//  ItemEntity.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class ItemEntity<T> {
    public var content: T?
    weak var section: SectionEntity<T>?
}


extension ItemEntity: Equatable {
    
}

public func ==<T1, T2>(l: ItemEntity<T1>, r: ItemEntity<T2>) -> Bool {
    return l === r
}
