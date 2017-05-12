//
//  Change.swift
//  Pods
//
//  Created by Tulipa on 10/11/2016.
//
//

import Foundation

public enum DataValue<T1, T2> {
    case section(T1)
    case item(T2)
}

public enum Change<T> {
    case add(T)
    case remove(T)
    case reload(T)
}

public class ChangeOperation {
    
    public init(_ changes: [Change<DataValue<Int, IndexPath>>] = []) {
        self.changes = changes
    }
    
    public let changes: [Change<DataValue<Int, IndexPath>>]
    
    var _complete: (() -> Void)?
    var _commit: (() -> Void)?
    
    public func complete() {
        _complete?()
        _complete = nil
    }
    
    public func commit() {
        _commit?()
        _commit = nil
    }
}

