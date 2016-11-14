//
//  Section&Cell.swift
//  ReactiveDataSource
//
//  Created by 臧金晓 on 14/11/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import ReactiveDataSource

class MyCellEntity: CollectionViewCellEntity {
    override func cellClass() -> CollectionViewCell.Type {
        return MyCell.self
    }
    
    init(_ value: Int) {
        self.value = value
    }
    
    let value: Int
}

class MyCell: CollectionViewCell {
    override func render(with entity: CollectionViewCellEntity) {
        if let entity = entity as? MyCellEntity {
            if let label = contentView.viewWithTag(666) as? UILabel {
                label.text = "\(entity.value)"
                contentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        contentView.addSubview(label)
        label.textAlignment = .center
        label.tag = 666
        label.frame = contentView.bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder aDecoder: NSCoder) {
       return nil
    }
}
