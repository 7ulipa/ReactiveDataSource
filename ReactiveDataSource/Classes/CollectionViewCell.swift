//
//  CollectionViewCell.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

open class CollectionViewCell: UICollectionViewCell, Renderable, Reusable {
    public typealias reuseContainerType = UICollectionView
    
    public typealias Entity = CollectionViewCellEntity
    open func render(with entity: CollectionViewCellEntity) {
        //for override
    }
    
    public static func register(for container: UICollectionView) {
        container.register(self, forCellWithReuseIdentifier: reuseIdentifier())
    }
}
