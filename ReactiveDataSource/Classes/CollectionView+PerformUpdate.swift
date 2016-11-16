//
//  CollectionView+PerformUpdate.swift
//  Pods
//
//  Created by 臧金晓 on 14/11/2016.
//
//

import UIKit

extension UICollectionView: ReactiveDataSourceDelegate {
    public func perform(_ operation: ChangeOperation) {
        performBatchUpdates({ 
            operation.commit()
            operation.changes.forEach({ (change) in
                switch change {
                case .add(let add):
                    switch add {
                    case .section(let section):
                        self.insertSections(IndexSet(integer: section))
                    case .item(let item):
                        self.insertItems(at: [item])
                    }
                case .remove(let remove):
                    switch remove {
                    case .section(let section):
                        self.deleteSections(IndexSet(integer: section))
                    case .item(let item):
                        self.deleteItems(at: [item])
                    }
                case .reload(let reload):
                    switch reload {
                    case .item(let item):
                        self.reloadItems(at: [item])
                    case .section(let section):
                        self.reloadSections(IndexSet(integer: section))
                    }
                }
            })
        }) { (_) in
            operation.complete()
        }
    }
}
