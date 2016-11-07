//
//  ReactiveDataSource.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

enum DataSourceChange<T> {
    case add(T)
    case delete(T)
}

public class ReactiveDataSource<T> {
    
    init(_ sections: [SectionEntity<T>] = []) {
        data = sections
        _data = sections
    }
    
    public private(set) var data: [SectionEntity<T>]
    
    fileprivate var _data: [SectionEntity<T>]
    
    fileprivate var changes: [DataSourceChange<SectionEntity<T>>] = []
    
    public func delete(_ section: SectionEntity<T>) {
        if let index = data.index(of: section) {
            changes.append(.delete(section))
        }
    }
    
    public func delete(_ index: Int) {
        if index < data.count {
            changes.append(.delete(data[index]))
        }
    }
    
    public func append(_ section: SectionEntity<T>) {
        _data.append(section)
        section.dataSource = self
        changes.append(.add(section))
    }
    
    public func insert(_ section: SectionEntity<T>, at index: Int) {
        insert([section], at: index)
    }
    
    public func insert(_ sections: [SectionEntity<T>], at index: Int) {
        _data.insert(contentsOf: sections, at: index)
        sections.forEach { (section) in
            section.dataSource = self
            changes.append(.add(section))
        }
    }
}
