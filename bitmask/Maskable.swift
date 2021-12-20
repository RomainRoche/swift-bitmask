//
//  Maskable.swift
//  bitmask
//
//  Created by Romain Roche on 18/12/2021.
//

import Foundation

/// The `Maskabke` protocol defines how to conform to be able to be used
/// as a `Bitmask`.
public protocol Maskable {
    associatedtype Value: FixedWidthInteger
    var rawValue: Value { get }
}

public extension Maskable {
    
    /// The bitwise `&` operator.
    /// - Parameter lhs: The left `Maskable` on which the operator will apply.
    /// - Parameter rhs: The right `Maskable` on which the operator will apply.
    /// - Returns: A `Maskable.Value`.
    static func & (
        lhs: Self,
        rhs: Self
    ) -> Self.Value {
        return lhs.rawValue & rhs.rawValue
    }
    
    /// The bitwise `|` operator.
    /// - Parameter lhs: The left `Maskable` on which the operator will apply.
    /// - Parameter rhs: The right `Maskable` on which the operator will apply.
    /// - Returns: A `Maskable.Value`.
    static func | (
        lhs: Self,
        rhs: Self
    ) -> Self.Value {
        return lhs.rawValue | rhs.rawValue
    }
    
}
