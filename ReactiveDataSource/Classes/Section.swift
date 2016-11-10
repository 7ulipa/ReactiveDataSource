//
//  Section.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class Section {
    
    public private(set) var items: [Item] = []
    
    var _item: [Item] = []
    
    weak var dataSource: ReactiveDataSource.ChangeMaker?
    
    public init(_ items: [Item]) {
        self.items = items
        items.forEach { (item) in
            item.section = self
        }
    }
    
    public func remove() {
        dataSource?.remove(self)
    }
    
    public func append(_ item: Item) {
        insert(item, at: items.count)
    }
    
    public func insert(_ item: Item, at index: Int) {
        item.section = self
        items.insert(item, at: index)
        dataSource?.changes.append(.add(.item(item)))
    }
    
    public func remove(_ item: Item) {
        if let index = items.index(of: item) {
            dataSource?.changes.append(.remove(.item(item)))
            items.remove(at: index)
        }
    }
    
    public func remove(at index: Int) {
        let item = items[index]
        dataSource?.changes.append(.remove(.item(item)))
        items.remove(at: index)
    }
}

extension Section: Equatable {
    
}

public func ==(l: Section, r: Section) -> Bool {
    return l === r
}
