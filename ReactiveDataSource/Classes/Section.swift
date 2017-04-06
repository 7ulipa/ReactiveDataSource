//
//  Section.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

open class Section {
    
    public private(set) var items: [Item] = []
    
    public func item<T: Item>(at index: Int) -> T? {
        if index < _items.count {
            return _items[index] as? T
        }
        return nil
    }
    
    var _items: [Item] = []
    
    weak var maker: ReactiveDataSource.ChangeMaker?
    
    public init(_ items: [Item] = []) {
        self.items = items
        items.forEach { (item) in
            item.section = self
        }
    }
    
    public func remove() {
        maker?.remove(self)
    }
    
    public func append(_ item: Item) {
        insert(item, at: items.count)
    }
    
    public func insert(_ item: Item, at index: Int) {
        item.section = self
        items.insert(item, at: index)
        maker?.changes.append(.add(.item(item)))
    }
    
    public func remove(_ item: Item) {
        if let index = items.index(of: item) {
            maker?.changes.append(.remove(.item(item)))
            items.remove(at: index)
        }
    }
    
    public func remove(at index: Int) {
        let item = items[index]
        maker?.changes.append(.remove(.item(item)))
        items.remove(at: index)
    }
    
    public var sectionForRemove: Int? {
        get {
            return maker?._sections.index(of: self)
        }
    }
    
    public var sectionForAdd: Int? {
        return maker?.sections.index(of: self)
    }
    
    func commit() {    
        _items = items
    }
}

extension Section: Equatable {
    
}

public func ==(l: Section, r: Section) -> Bool {
    return l === r
}
