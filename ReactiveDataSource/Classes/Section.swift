//
//  Section.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

open class Section {
    
    public internal(set) var items: [Item] = []
    
    public weak var sectionChangeMaker: ReactiveDataSource.SectionChangeMaker?
    
    public init(_ items: [Item] = []) {
        self.items = items
        items.forEach { (item) in
            item.section = self
        }
    }
}

extension Section: Equatable {
    
}

public func ==(l: Section, r: Section) -> Bool {
    return l === r
}
