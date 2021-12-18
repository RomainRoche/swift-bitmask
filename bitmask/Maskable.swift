//
//  Maskable.swift
//  bitmask
//
//  Created by Romain Roche on 18/12/2021.
//

import Foundation

public protocol Maskable {
    associatedtype T = FixedWidthInteger
    var rawValue: T { get }
}

public extension Maskable {
    
    static func & (
        lhs: Self,
        rhs: Self
    ) -> Self.T where T: FixedWidthInteger {
        return lhs.rawValue & rhs.rawValue
    }
    
    static func | (
        lhs: Self,
        rhs: Self
    ) -> Self.T where T: FixedWidthInteger {
        return lhs.rawValue | rhs.rawValue
    }
    
}
