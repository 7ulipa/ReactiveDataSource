//
//  CollectionViewCell.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

open class CollectionViewCell: UICollectionViewCell, Renderable, Reusable {
    public typealias Entity = CollectionViewCellEntity
    open func render(with entity: CollectionViewCellEntity) {
        //for override
    }
}

public extension Reusable where Self: UICollectionViewCell {
    static func register(for collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier())
    }
}
