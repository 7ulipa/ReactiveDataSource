//
//  CollectionViewItem.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

public class CollectionViewCellEntity: Item {
    public func cellClass() -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
}
