//
//  CollectionViewItem.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

open class CollectionViewCellEntity: Item {
    open func cellClass() -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
}
