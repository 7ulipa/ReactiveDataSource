//
//  ViewModel.swift
//  ReactiveDataSource
//
//  Created by 臧金晓 on 14/11/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import ReactiveDataSource

class ViewModel: ReactiveCollectionViewDataSource {
    func refresh() {
        self.perform(changes: { (maker) in
            self.sections.forEach({ (section) in
                section.append(MyCellEntity(self.value))
                self.value += 1
            })
            let section = CollectionViewSection([MyCellEntity(self.value)])
            self.value += 1
            maker.append(section)
        })
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    var value = 0
    @objc func timerAction() {
        
        self.perform(changes: { (maker) in
            
            if maker.sections.first?.items.count ?? 0 > 10 {
                maker.sections.first?.items.forEach({ (item) in
                    if let item = item as? MyCellEntity {
                        if item.value % 2 == 1 {
                            item.remove()
                        }
                    }
                })
            }
            
            if maker.sections.first?.items.count ?? 0 > 20 {
                maker.sections.first?.items.forEach({ (item) in
                    if let item = item as? MyCellEntity {
                        if item.value % 2 == 0 {
                            item.remove()
                        }
                    }
                })
            }
            maker.sections.forEach({ (section) in
                for _ in 0..<5 {
                    section.append(MyCellEntity(self.value))
                    self.value += 1
                }
            })
            
        })
    }
}
