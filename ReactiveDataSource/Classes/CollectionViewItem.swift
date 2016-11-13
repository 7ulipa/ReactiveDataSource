//
//  CollectionViewItem.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

public class CollectionViewItem: Item {
    public func cellClass() -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
}
