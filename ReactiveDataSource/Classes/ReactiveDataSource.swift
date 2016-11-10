//
//  ReactiveDataSource.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class ReactiveDataSource {
    
    private let queue: OperationQueue = ReactiveDataSource.createQueue()
    
    init(_ sections: [Section] = []) {
        self.sections = sections
    }
    
    public private(set) var sections: [Section]
    
    public func perform(changes: @escaping (ChangeMaker) -> Void) {
        queue.addOperation {
            let maker = ChangeMaker(self.sections)
            changes(maker)
            
        }
    }
}

extension ReactiveDataSource {
    fileprivate class func createQueue() -> OperationQueue {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }
}

