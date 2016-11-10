//
//  Change.swift
//  Pods
//
//  Created by Tulipa on 10/11/2016.
//
//

import Foundation

enum Change {
    enum Value {
        case section(Section)
        case item(Item)
    }
    case add(Value)
    case remove(Value)
}
