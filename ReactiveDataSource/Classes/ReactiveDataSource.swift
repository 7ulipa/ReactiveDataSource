//
//  ReactiveDataSource.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

public class ReactiveDataSource: NSObject {
    
    weak var delegate: ReactiveDataSourceDelegate?
    
    private let queue: OperationQueue = ReactiveDataSource.createQueue()
    
    init(_ sections: [Section] = []) {
        self.sections = sections
        super.init()
    }
    
    public private(set) var sections: [Section]
    
    public func perform(changes: @escaping (ChangeMaker) -> Void) {
        queue.addOperation {
            let maker = ChangeMaker(self.sections)
            changes(maker)
            let changes = maker.caculateChanges()
            let operation = ChangeOperation()
            
            let sem = DispatchSemaphore(value: 0)
            
            operation._commit = {
                maker.commit()
                self.sections = maker.sections
            }
            
            operation._complete = {
                sem.signal()
            }
            
            self.delegate?.perform(operation)
            
            sem.wait()
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

public protocol ReactiveDataSourceDelegate: class {
    func perform(_ operation: ChangeOperation)
}

