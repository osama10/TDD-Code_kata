//
//  TrialPeriodTests.swift
//  TestingTimeTDDTests
//
//  Created by Paul Solt on 1/25/19.
//  Copyright © 2019 Paul Solt. All rights reserved.
//

import XCTest

// Test code in your main module when dynamically linking unit tests
// @testable import TestingTimeTDD

struct TrialPeriod {
    let expiredDate: Date

    init(_ expiredDate: Date) {
        self.expiredDate = expiredDate
    }

    func isExpired() -> Bool {
        expiredDate < Date()
    }
}

class TrialPeriodTests: XCTestCase {

    // All test functions start with the word "test"

    func test_trial_peroid_should_expire_when_past_expired_date() {
        let timeTraverler = TimeTraveler(date: Date())
        let expiredDate = timeTraverler.timeTravelBy(days: -1)

        let trial = TrialPeriod(expiredDate)
        XCTAssertTrue(trial.isExpired())
    }

    func test_trial_peroid_should_not_expire_when_not_past_expired_date() {
        let timeTraverler = TimeTraveler(date: Date())
        let expiredDate = timeTraverler.timeTravelBy(days: 1)

        let trial = TrialPeriod(expiredDate)
        XCTAssertFalse(trial.isExpired())
    }

    func testArrangeActAssert() {
        // Arrange
        let x = 20
        let y = 40
        let expected = 60

        // Act
        let actual = x + y

        // Assert
        XCTAssertEqual(expected, actual)
    }
}
