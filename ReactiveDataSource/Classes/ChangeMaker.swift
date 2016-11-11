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
        
        var _sections: [Section]
    
        var changes: [Change<DataValue<Section, Item>>] = []
        
        init(_ sections: [Section]) {
            self.sections = sections
            _sections = sections
            sections.forEach { (section) in
                section.maker = self
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
            section.maker = self
            sections.insert(section, at: index)
            changes.append(.add(.section(section)))
        }
        
        func commit() {
            sections = _sections
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
                        if let section = section.sectionForAdd {
                            return [Change.add(DataValue.section(section))]
                        } else {
                            return []
                        }
                    }
                    
                case .remove(let remove):
                    switch remove {
                    case .section(let section):
                        if let section = section.sectionForRemove {
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
                        if let section = section.sectionForAdd {
                            return [Change.reload(DataValue.section(section))]
                        } else {
                            return []
                        }
                    }
                }
            })
        }
    }
}
