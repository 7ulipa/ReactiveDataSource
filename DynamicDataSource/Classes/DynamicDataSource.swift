//
//  ReactiveCollectionViewDataSource.swift
//  ReactiveCollectionViewDataSource
//
//  Created by Tulipa on 07/11/2016.
//  Copyright © 2016 Tulipa. All rights reserved.
//

import UIKit

public protocol DynamicDataSourceDelegate: NSObjectProtocol {
    
}

public class DynamicDataSource<T> {
    fileprivate var data = [SectionEntity<T>]()
    
    public weak var delegate: DynamicDataSourceDelegate?
    
    public func append(section: SectionEntity<T>) {
        
    }
    
    public func append(sections: [SectionEntity<T>]) {
        
    }
}
