//
//  Bitmask.swift
//  bitmask
//
//  Created by Romain Roche on 17/12/2021.
//

import Foundation

infix operator &~   : AdditionPrecedence
infix operator &?   : AdditionPrecedence

/// The `Bitmask` structure allows to store a `Maskable` value and apply bitwise operators
/// to it and handle *bitmask* operations.
public struct Bitmask<Mask: Maskable> {
    
    // MARK: - public
    
    /// A helper to create an empty Bitmask.
    public static var none: Self {
        return Self()
    }
    
    /// The raw value of the bitmask.
    public private(set) var rawValue: Mask.Value
    
    /// Init a `Bitmask`.
    /// - Parameter mask: The `Mask` value.
    public init(with mask: Mask) {
        self.init(withRawValue: mask.rawValue)
    }
    
    /// Init a `Bitmask` with a raw value.
    /// - Parameter rawValue: The raw value.
    public init(withRawValue rawValue: Mask.Value) {
        self.rawValue = rawValue
    }
    
    /// Init an empty mask.
    public init() {
        self.rawValue = 0
    }
    
}

// MARK: - Bitmask unary operators

public extension Bitmask {
    
    /// The bitwise `NOT` operator.
    /// - Parameter lhs: The `Bitmask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static prefix func ~ (
        lhs: Self
    ) -> Self {
        return Self.init(withRawValue: ~lhs.rawValue)
    }
 
}

// MARK: - Bitmask to Bitmask operators

public extension Bitmask {
    
    /// The bitwise `&` operator.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func & (
        lhs: Self,
        rhs: Self
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue & rhs.rawValue)
    }
    
    /// The bitwise `|` operator.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func | (
        lhs: Self,
        rhs: Self
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue | rhs.rawValue)
    }
    
    /// The bitwise `&~` operator. This operator will *remove* `rhs` to `lhs`.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func &~ (
        lhs: Self,
        rhs: Self
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue & ~rhs.rawValue)
    }
    
    /// The bitwise `&?` operator. This operator will test if `lhs` *contains* `rhs`.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask` on which the operator will apply.
    /// - Returns: A `Bool`.
    static func &? (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.rawValue & rhs.rawValue != 0
    }
    
}

// MARK: - Bitmask to Maskable operators

public extension Bitmask {
    
    /// The bitwise `&` operator.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask.Mask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func & (
        lhs: Self,
        rhs: Mask
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue & rhs.rawValue)
    }
    
    /// The bitwise `|` operator.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask.Mask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func | (
        lhs: Self,
        rhs: Mask
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue | rhs.rawValue)
    }
    
    /// The bitwise `&~` operator. This operator will *remove* `rhs` to `lhs`.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask.Mask` on which the operator will apply.
    /// - Returns: A `Bitmask`.
    static func &~ (
        lhs: Self,
        rhs: Mask
    ) -> Self {
        return Self.init(withRawValue: lhs.rawValue & ~rhs.rawValue)
    }
    
    /// The bitwise `&?` operator. This operator will test if `lhs` *contains* `rhs`.
    /// - Parameter lhs: The left `Bitmask` on which the operator will apply.
    /// - Parameter rhs: The right `Bitmask.Mask` on which the operator will apply.
    /// - Returns: A `Bool`.
    static func &? (
        lhs: Self,
        rhs: Mask
    ) -> Bool {
        return lhs.rawValue & rhs.rawValue != 0
    }
    
}

extension Bitmask: Codable where Mask.Value: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw: Mask.Value = try container.decode(Mask.Value.self)
        self.init(withRawValue: raw)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
    
}

extension Bitmask: Equatable {

    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

}
