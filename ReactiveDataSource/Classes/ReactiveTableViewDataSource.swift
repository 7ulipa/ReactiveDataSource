//
//  ReactiveTableViewDataSource.swift
//  Pods
//
//  Created by 臧金晓 on 16/11/2016.
//
//

import Foundation

open class ReactiveTableViewDataSource: ReactiveDataSource, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section]._items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let entity = sections[indexPath.section]._items[indexPath.row] as? TableViewCellEntity {
            if let cell = tableView.dequeueReusableCell(withIdentifier: entity.cellClass().reuseIdentifier(), for: indexPath) as? TableViewCell {
                cell.render(with: entity)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
