//
//  TableViewCell.swift
//  Pods
//
//  Created by 臧金晓 on 16/11/2016.
//
//

import Foundation

open class TableViewCell: UITableViewCell, Renderable, Reusable {
    
    public typealias reuseContainerType = UITableView
    
    public typealias Entity = TableViewCellEntity
    
    public func render(with entity: TableViewCellEntity) {
        
    }
    
    public static func register(for container: UITableView) {
        container.register(self, forCellReuseIdentifier: reuseIdentifier())
    }
}
