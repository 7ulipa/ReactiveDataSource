//
//  Item.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

open class Item {
    public weak var section: Section?
    
    public func remove() {
        section?.remove(self)
    }
    
    public init() {
        
    }
    
    public var indexPathForRemove: IndexPath? {
        get {
            if let section = section?.sectionForRemove {
                if let itemIndex = itemForRemove {
                    return IndexPath(item: itemIndex, section: section)
                }
            }
            return nil
        }
    }
    
    public var indexPathForAdd: IndexPath? {
        get {
            if let section = section?.sectionForAdd {
                if let itemIndex = itemForAdd {
                    return IndexPath(item: itemIndex, section: section)
                }
            }
            return nil
        }
    }
    
    public var itemForAdd: Int? {
        get {
            return section?.items.index(of: self)
        }
    }
    
    public var itemForRemove: Int? {
        get {
            return section?._items.index(of: self)
        }
    }
}


extension Item: Equatable {
    
}

public func == (l: Item, r: Item) -> Bool {
    return l === r
}
