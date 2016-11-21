//
//  TableView+PerformUpdate.swift
//  Pods
//
//  Created by 臧金晓 on 16/11/2016.
//
//

import Foundation

extension UITableView: ReactiveDataSourceDelegate {
    
    public func perform(_ operation: ChangeOperation) {
        perform(operation, action: .automatic)
    }
    
    public func perform(_ operation: ChangeOperation, action: UITableViewRowAnimation) {
        beginUpdates()
        operation.commit()
        operation.changes.forEach({ (change) in
            switch change {
            case .add(let add):
                switch add {
                case .section(let section):
                    insertSections(IndexSet(integer: section), with: action)
                case .item(let item):
                    insertRows(at: [item], with: action)
                }
            case .remove(let remove):
                switch remove {
                case .section(let section):
                    deleteSections(IndexSet(integer: section), with: action)
                case .item(let item):
                    deleteRows(at: [item], with: action)
                }
            case .reload(let reload):
                switch reload {
                case .item(let item):
                    reloadRows(at: [item], with: action)
                case .section(let section):
                    reloadSections(IndexSet(integer: section), with: action)
                }
            }
        })
        operation.complete()
        endUpdates()
    }
}
