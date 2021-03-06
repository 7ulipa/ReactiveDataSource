//
//  CollectionViewCell.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

open class CollectionViewCell: UICollectionViewCell, Renderable, Reusable {
    
    public typealias Container = UICollectionView
    public typealias Entity = CollectionViewCellEntity
    public typealias Dimension = CGSize
    
    open func render(with entity: CollectionViewCellEntity) {
        //for override
    }
    
    public static func register(for container: UICollectionView) {
        container.register(self, forCellWithReuseIdentifier: reuseIdentifier())
    }
    
    open class func preferredDimension(for entity: CollectionViewCellEntity, in container: UICollectionView) -> CGSize {
        return CGSize.zero
    }
}
