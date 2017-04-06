//
//  ReactiveCollectionViewDataSource.swift
//  Pods
//
//  Created by Tulipa on 12/11/2016.
//
//

import Foundation

open class ReactiveCollectionViewDataSource: ReactiveDataSource, UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public override init(_ sections: [Section] = []) {
        super.init(sections)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let entity = sections[indexPath.section].items[indexPath.item] as? CollectionViewCellEntity {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: entity.cellClass().reuseIdentifier(), for: indexPath) as? CollectionViewCell {
                cell.render(with: entity)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
}
