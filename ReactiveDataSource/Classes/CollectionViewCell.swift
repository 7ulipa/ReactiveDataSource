//
//  CollectionViewCell.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

public class CollectionViewCell: UICollectionViewCell, Renderable, Reusable {
    public typealias Entity = CollectionViewCellEntity
    public func render(with entity: CollectionViewCellEntity) {
        //for override
    }
}

public extension Reusable where Self: UICollectionViewCell {
    static func register(for collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier())
    }
}
