//
//  ReactiveDataSource.swift
//  Pods
//
//  Created by Tulipa on 07/11/2016.
//
//

import Foundation

open class ReactiveDataSource: NSObject {
    
    public weak var delegate: ReactiveDataSourceDelegate?
    
    private let queue: OperationQueue = ReactiveDataSource.createQueue()
    
    public init(_ sections: [Section] = []) {
        self.sections = sections
        super.init()
    }
    
    public var sections: [Section]
    
    public func perform(changes: @escaping (ChangeMaker) -> Void, complete: (() -> Void)? = nil) {
        queue.addOperation {
            let maker = ChangeMaker(self.sections)
            changes(maker)
            let changes = maker.caculateChanges()
            let operation = ChangeOperation(changes)
            
            let sem = DispatchSemaphore(value: 0)
            
            operation._commit = {
                maker.commit()
                self.sections = maker.sections.map { $0.section }
                maker.didCommit.forEach { $0() }
            }
            
            operation._complete = {
                sem.signal()
            }
            
            DispatchQueue.main.async {
                self.delegate?.perform(operation)
            }
            
            sem.wait()
            complete?()
            maker.didComplete.forEach { $0() }
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

