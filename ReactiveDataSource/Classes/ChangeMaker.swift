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
        
        public var sections: [SectionChangeMaker]
        
        var _sections: [SectionChangeMaker]
    
        var changes: [Change<DataValue<Section, Item>>] = []
        
        public var didCommit: [(() -> Void)] = []
        public var didComplete: [(() -> Void)] = []
        
        init(_ sections: [Section]) {
            self.sections = sections.map(SectionChangeMaker.init)
            _sections = self.sections
            _sections.forEach { (section) in
                section.changeMaker = self
            }
        }
        
        public func remove(_ section: Section) {
            if let maker = section.sectionChangeMaker {
                remove(maker)
            }
        }
        
        public func remove(_ maker: SectionChangeMaker) {
            if let index = sections.index(of: maker) {
                sections.remove(at: index)
                changes.append(.remove(.section(maker.section)))
            }
        }
        
        public func remove(at index: Int) {
            let maker = sections[index]
            sections.remove(at: index)
            changes.append(.remove(.section(maker.section)))
        }
        
        public func append(_ section: Section) {
            insert(section, at: sections.count)
        }
        
        public func insert(_ section: Section, at index: Int) {
            let maker = SectionChangeMaker(section)
            maker.changeMaker = self
            sections.insert(maker, at: index)
            changes.append(.add(.section(maker.section)))
        }
        
        func commit() {
            _sections = sections
            sections.forEach { (section) in
                section.commit()
            }
        }
        
        public func caculateChanges() -> [Change<DataValue<Int, IndexPath>>] {
            return changes.flatMap ({ (change) -> [Change<DataValue<Int, IndexPath>>] in
                switch change {
                case .add(let add):
                    switch add {
                    case .item(let item):
                        if let indexPath = item.indexPathForAdd {
                            return [Change.add(DataValue.item(indexPath))]
                        } else {
                            return []
                        }
                    case .section(let section):
                        if let section = section.sectionChangeMaker?.sectionForAdd {
                            return [Change.add(DataValue.section(section))]
                        } else {
                            return []
                        }
                    }
                    
                case .remove(let remove):
                    switch remove {
                    case .section(let section):
                        if let section = section.sectionChangeMaker?.sectionForRemove {
                            return [Change.remove(DataValue.section(section))]
                        } else {
                            return []
                        }
                    case .item(let item):
                        if let indexPath = item.indexPathForRemove {
                            return [Change.remove(DataValue.item(indexPath))]
                        } else {
                            return []
                        }
                    }
                    
                case .reload(let reload):
                    switch reload {
                    case.item(let item):
                        if let indexPath = item.indexPathForAdd {
                            return [Change.reload(DataValue.item(indexPath))]
                        } else {
                            return []
                        }
                    case .section(let section):
                        if let section = section.sectionChangeMaker?.sectionForAdd {
                            return [Change.reload(DataValue.section(section))]
                        } else {
                            return []
                        }
                    }
                }
            })
        }
    }
    
    public class SectionChangeMaker {
        weak var changeMaker: ChangeMaker?
        public let section: Section
        public var items: [Item]
        
        init(_ section: Section) {
            self.section = section
            items = section.items
            section.sectionChangeMaker = self
        }
        
        public func remove() {
            changeMaker?.remove(self)
        }
        
        public func append(_ item: Item) {
            insert(item, at: items.count)
        }
        
        public func insert(_ item: Item, at index: Int) {
            item.section = section
            items.insert(item, at: index)
            changeMaker?.changes.append(.add(.item(item)))
        }
        
        public func remove(_ item: Item) {
            if let index = items.index(of: item) {
                changeMaker?.changes.append(.remove(.item(item)))
                items.remove(at: index)
            }
        }
        
        public func remove(at index: Int) {
            let item = items[index]
            changeMaker?.changes.append(.remove(.item(item)))
            items.remove(at: index)
        }
        
        public var sectionForRemove: Int? {
            get {
                return changeMaker?._sections.index(of: self)
            }
        }
        
        public var sectionForAdd: Int? {
            return changeMaker?.sections.index(of: self)
        }
        
        func commit() {    
            section.items = items
        }
    }
}

extension ReactiveDataSource.SectionChangeMaker: Equatable {
    public static func ==(l: ReactiveDataSource.SectionChangeMaker, r: ReactiveDataSource.SectionChangeMaker) -> Bool {
        return l === r
    }
}


