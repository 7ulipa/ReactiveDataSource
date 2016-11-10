//
//  ChangeMaker.swift
//  Pods
//
//  Created by Tulipa on 10/11/2016.
//
//

import Foundation

extension ReactiveDataSource {
    
    public class ChangeMaker {
        
        public var sections: [Section]
        
        private var _sections: [Section]
    
        var changes: [Change] = []
        
        init(_ sections: [Section]) {
            self.sections = sections
            _sections = sections
            sections.forEach { (section) in
                section.dataSource = self
            }
        }
        
        public func remove(_ section: Section) {
            if let index = sections.index(of: section) {
                sections.remove(at: index)
                changes.append(.remove(.section(section)))
            }
        }
        
        public func remove(at index: Int) {
            let section = sections[index]
            sections.remove(at: index)
            changes.append(.remove(.section(section)))
        }
        
        public func append(_ section: Section) {
            insert(section, at: sections.count)
        }
        
        public func insert(_ section: Section, at index: Int) {
            section.dataSource = self
            sections.insert(section, at: index)
            changes.append(.add(.section(section)))
        }
    }
}
