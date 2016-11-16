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
        beginUpdates()
        operation.commit()
        operation.changes.forEach({ (change) in
            switch change {
            case .add(let add):
                switch add {
                case .section(let section):
                    insertSections(IndexSet(integer: section), with: .automatic)
                case .item(let item):
                    insertRows(at: [item], with: .automatic)
                }
            case .remove(let remove):
                switch remove {
                case .section(let section):
                    deleteSections(IndexSet(integer: section), with: .automatic)
                case .item(let item):
                    deleteRows(at: [item], with: .automatic)
                }
            case .reload(let reload):
                switch reload {
                case .item(let item):
                    reloadRows(at: [item], with: .automatic)
                case .section(let section):
                    reloadSections(IndexSet(integer: section), with: .automatic)
                }
            }
        })
        operation.complete()
        endUpdates()
    }
}
