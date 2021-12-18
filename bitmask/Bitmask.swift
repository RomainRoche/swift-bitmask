//
//  Bitmask.swift
//  bitmask
//
//  Created by Romain Roche on 17/12/2021.
//

import Foundation

public struct Bitmask<Mask: Maskable> {
    
    // MARK: - private
    
    private init(withRawValue rawValue: Mask.T) {
        self.rawValue = rawValue
    }
    
    // MARK: - public
    
    private(set) var rawValue: Mask.T
    
    public init(with mask: Mask) {
        self.init(withRawValue: mask.rawValue)
    }
    
    public static func & (
        lhs: Self,
        rhs: Self
    ) -> Self where Mask.T: FixedWidthInteger {
        return Self.init(withRawValue: lhs.rawValue & rhs.rawValue)
    }
    
    public static func | (
        lhs: Self,
        rhs: Self
    ) -> Self where Mask.T: FixedWidthInteger {
        return Self.init(withRawValue: lhs.rawValue | rhs.rawValue)
    }
    
    public static func & (
        lhs: Self,
        rhs: Mask
    ) -> Self where Mask.T: FixedWidthInteger {
        return Self.init(withRawValue: lhs.rawValue & rhs.rawValue)
    }
    
    public static func | (
        lhs: Self,
        rhs: Mask
    ) -> Self where Mask.T: FixedWidthInteger {
        return Self.init(withRawValue: lhs.rawValue | rhs.rawValue)
    }
    
}
