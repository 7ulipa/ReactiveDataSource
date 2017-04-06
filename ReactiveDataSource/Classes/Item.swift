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
        section?.sectionChangeMaker?.remove(self)
    }
    
    public init() {
        
    }
    
    var indexPathForRemove: IndexPath? {
        get {
            if let section = section?.sectionChangeMaker?.sectionForRemove {
                if let itemIndex = itemForRemove {
                    return IndexPath(item: itemIndex, section: section)
                }
            }
            return nil
        }
    }
    
    var indexPathForAdd: IndexPath? {
        get {
            if let section = section?.sectionChangeMaker?.sectionForAdd {
                if let itemIndex = itemForAdd {
                    return IndexPath(item: itemIndex, section: section)
                }
            }
            return nil
        }
    }
    
    var itemForAdd: Int? {
        get {
            return section?.sectionChangeMaker?.items.index(of: self)
        }
    }
    
    var itemForRemove: Int? {
        get {
            return section?.items.index(of: self)
        }
    }
}


extension Item: Equatable {
    
}

public func == (l: Item, r: Item) -> Bool {
    return l === r
}
