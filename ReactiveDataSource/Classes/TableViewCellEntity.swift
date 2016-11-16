//
//  TableViewCellEntity.swift
//  Pods
//
//  Created by 臧金晓 on 16/11/2016.
//
//

import Foundation

open class TableViewCellEntity: Item {
    open func cellClass() -> TableViewCell.Type {
        return TableViewCell.self
    }
}
