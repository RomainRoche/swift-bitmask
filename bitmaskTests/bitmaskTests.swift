//
//  bitmaskTests.swift
//  bitmaskTests
//
//  Created by Romain Roche on 17/12/2021.
//

import XCTest
@testable import Bitmask

class bitmaskTests: XCTestCase {

    enum TestEnum: Int, Maskable {
        case none   = 0b00000000
        case first  = 0b00000001
        case second = 0b00000010
        case third  = 0b00000100
        case fourth = 0b00001000
        case fifth  = 0b00010000
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - General Bitmask operations
    
    func test_bitmask_init() throws {
        let bitmask = Bitmask(with: TestEnum.second)
        XCTAssert(bitmask.rawValue == 2)
    }
    
    func test_bitmask_invert() throws {
        var bitmask = Bitmask(with: TestEnum.second)
        bitmask = ~bitmask
        XCTAssert(bitmask.rawValue == ~0b10)
    }
    
    // MARK: - Bitmask to Bitmask operators tests
    
    func test_bitmask_to_bitmask_and() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask & Bitmask(with: TestEnum.second)
        XCTAssert(bitmask.rawValue == 0)
    }
    
    func test_bitmask_to_bitmask_or() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask | Bitmask(with: TestEnum.second)
        XCTAssert(bitmask.rawValue == 3)
    }
    
    func test_bitmask_to_bitmask_and_none() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask & Bitmask(with: TestEnum.none)
        XCTAssert(bitmask.rawValue == 0)
    }
    
    func test_bitmask_to_bitmask_and_not() throws {
        var bitmask = Bitmask(with: TestEnum.first) | Bitmask(with: TestEnum.third)
        XCTAssert(bitmask.rawValue == 5)
        bitmask = bitmask &~ Bitmask(with: TestEnum.third)
        XCTAssert(bitmask.rawValue == 1)
    }
    
    func test_bitmask_to_bitmask_and_bool() throws {
        let bitmask = Bitmask(with: TestEnum.first) | Bitmask(with: TestEnum.second)
        XCTAssert(bitmask &? Bitmask(with: TestEnum.first) == true)
        XCTAssert(bitmask &? Bitmask(with: TestEnum.second) == true)
        XCTAssert(bitmask &? Bitmask(with: TestEnum.third) == false)
    }
    
    // MARK: - Bitmask to Maskable operators tests
    
    func test_bitmask_and() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask & .second
        XCTAssert(bitmask.rawValue == 0)
    }
    
    func test_bitmask_or() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask | .second
        XCTAssert(bitmask.rawValue == 3)
    }
    
    func test_bitmask_and_none() throws {
        var bitmask = Bitmask(with: TestEnum.first)
        bitmask = bitmask & TestEnum.none
        XCTAssert(bitmask.rawValue == 0)
    }
    
    func test_bitmask_and_not() throws {
        var bitmask = Bitmask(with: TestEnum.first) | .third
        XCTAssert(bitmask.rawValue == 5)
        bitmask = bitmask &~ .third
        XCTAssert(bitmask.rawValue == 1)
    }
    
    func test_bitmask_and_bool() throws {
        let bitmask = Bitmask(with: TestEnum.first) | .second
        XCTAssert(bitmask &? .first == true)
        XCTAssert(bitmask &? .second == true)
        XCTAssert(bitmask &? .third == false)
    }
    
    // MARK: - Bitmask equatable
    
    func test_bitmask_equatable_true() throws {
        let mask0 = Bitmask(with: TestEnum.first) | .second
        let mask1 = Bitmask(with: TestEnum.second) | .first
        XCTAssert(mask0 == mask1)
    }
    
    func test_bitmask_equatable_false() throws {
        let mask0 = Bitmask(with: TestEnum.first) | .second
        let mask1 = Bitmask(with: TestEnum.second) | .third
        XCTAssert(mask0 != mask1)
    }
    
    // MARK: - Maskable operators
    
    func test_maskable_or() throws {
        let maskable = TestEnum.first | TestEnum.second
        XCTAssert(maskable == 3)
    }
    
    func test_maskable_and_is_ok() throws {
        let maskable = TestEnum.second & TestEnum.second
        XCTAssert(maskable == 2)
    }
    
    func test_maskable_and_is_zero() throws {
        let maskable = TestEnum.second & TestEnum.first
        XCTAssert(maskable == 0)
    }
    
}
