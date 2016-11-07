//
//  ItemEntity.swift
//  ReactiveCollectionViewDataSource
//
//  Created by Tulipa on 07/11/2016.
//  Copyright © 2016 Tulipa. All rights reserved.
//

import Foundation

class ItemEntity<T> {
    var content: T?
    
    fileprivate weak var section: SectionEntity<T>?
    
    
}
