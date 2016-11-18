//
//  TableViewCell.swift
//  Pods
//
//  Created by 臧金晓 on 16/11/2016.
//
//

import Foundation

open class TableViewCell: UITableViewCell, Renderable, Reusable {
    
    public typealias Container = UITableView
    public typealias Entity = TableViewCellEntity
    public typealias Dimension = CGFloat
    
    public func render(with entity: TableViewCellEntity) {
        
    }
    
    public static func register(for container: UITableView) {
        container.register(self, forCellReuseIdentifier: reuseIdentifier())
    }
    
    open class func preferredDimension(for entity: TableViewCellEntity, in container: UITableView) -> CGFloat {
        return 0
    }
}
