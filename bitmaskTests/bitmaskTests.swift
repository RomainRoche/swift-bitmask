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

    func test_bitmask_init() throws {
        let bitmask = Bitmask(with: TestEnum.second)
        XCTAssert(bitmask.rawValue == 2)
    }
    
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

}
