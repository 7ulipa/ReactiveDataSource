//
//  Item.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class Item {
    weak var section: Section?
    
    public func remove() {
        section?.remove(self)
    }
}


extension Item: Equatable {
    
}

public func == (l: Item, r: Item) -> Bool {
    return l === r
}
