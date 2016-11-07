//
//  SectionEntity.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class SectionEntity<T> {
    public var items: [ItemEntity<T>] = []
    var _items: [ItemEntity<T>] = []
    weak var dataSource: ReactiveDataSource<T>?
    
    fileprivate var changes: [DataSourceChange<SectionEntity<T>>] = []
    
    public func delete() {
        dataSource?.delete(self)
    }
    
    public func append(_ item: ItemEntity<T>) {
        
    }
}

extension SectionEntity: Equatable {
    
}

public func ==<T1, T2>(l: SectionEntity<T1>, r: SectionEntity<T2>) -> Bool {
    return l === r
}
