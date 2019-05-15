//
//  PhoneNumberTests.swift
//  InterviewScreeningTests
//
//  Created by Darren Lai on 5/14/19.
//  Copyright © 2019 Lai. All rights reserved.
//

import XCTest
@testable import InterviewScreening

class PhoneNumberTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test1() {
        let ph = PhoneNumber("+1(858)775-2868")
        XCTAssertEqual("+1(858)775-2868", ph.getOriginalText())
        XCTAssertEqual("+18587752868", ph.getStrippedNumber())
        XCTAssertEqual("(858)775-2868", ph.getValueAsNorthAmerican())
        XCTAssertEqual("+1.858.775.2868", ph.getValueAsInternational())
    }
    
    func test2() {
        let ph = PhoneNumber("+1(858)775-2868x123");
        XCTAssertEqual("+1(858)775-2868x123", ph.getOriginalText())
        XCTAssertEqual("+18587752868x123", ph.getStrippedNumber())
        XCTAssertEqual("(858)775-2868x123", ph.getValueAsNorthAmerican())
        XCTAssertEqual("+1(858)775-2868x123", ph.getValueAsInternational())
    }
    
    func test3() {
        let ph = PhoneNumber("+598.123.4567x858");
        
        XCTAssertEqual("+598.123.4567x858", ph.getOriginalText())
        XCTAssertEqual("+5981234567x858", ph.getStrippedNumber())
        XCTAssertEqual("", ph.getValueAsNorthAmerican())
        XCTAssertEqual("+598.123.456.7x858", ph.getValueAsInternational())
    }
    
    func test4() {
        let ph = PhoneNumber("+27 1234 5678 ext 4");
        
        XCTAssertEqual("+27 1234 5678 ext 4", ph.getOriginalText())
        XCTAssertEqual("+2712345678x4", ph.getStrippedNumber())
        XCTAssertEqual("", ph.getValueAsNorthAmerican())
        XCTAssertEqual("+27 1234 5678 ext 4", ph.getValueAsInternational())
    }
    
    func test5() {
        let ph = PhoneNumber("858-775-2868");
        
        XCTAssertEqual("858-775-2868", ph.getOriginalText())
        XCTAssertEqual("+18587752868", ph.getStrippedNumber())
        XCTAssertEqual("(858)775-2868", ph.getValueAsNorthAmerican())
        XCTAssertEqual("+1.858.775.2868", ph.getValueAsInternational())
    }
}
