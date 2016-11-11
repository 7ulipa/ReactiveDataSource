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
    
    var _complete: (() -> Void)?
    var _commit: (() -> Void)?
    
    public func complete() {
        objc_sync_enter(self)
        _complete?()
        _complete = nil
        objc_sync_exit(self)
    }
    
    deinit {
        objc_sync_enter(self)
        _complete?()
        objc_sync_exit(self)
    }
    
    public func commit() {
        _commit?()
    }
}

