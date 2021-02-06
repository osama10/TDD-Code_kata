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
    var expiredDate: Date

    init(_ expiredDate: Date) {
        self.expiredDate = expiredDate
    }

    func isExpired() -> Bool {
        expiredDate < Date()
    }

    mutating func reset() {
        /// assuming it will reset it for 5 more days
        let timeUtil  = TimeTraveler(date: expiredDate)
        expiredDate = timeUtil.timeTravelBy(days: 5)
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

    func test_when_reset_trial_period_then_it_reset() {
        let timeTraverler = TimeTraveler(date: Date())
        var trialPeriod = TrialPeriod(timeTraverler.date)
        let newExpiredData = timeTraverler.timeTravelBy(days: 5)
        trialPeriod.reset()
        XCTAssertEqual(trialPeriod.expiredDate, newExpiredData)
    }

    func test_reset_when_trial_period_is_less_than_5_days() {
        let timeTraverler = TimeTraveler(date: Date())
        var trialPeriod = TrialPeriod(timeTraverler.date)
        let newExpiredData = timeTraverler.timeTravelBy(days: 3)
        trialPeriod.reset()
        XCTAssertNotEqual(trialPeriod.expiredDate, newExpiredData)
    }

    func test_reset_when_trial_period_is_more_than_5_days() {
        let timeTraverler = TimeTraveler(date: Date())
        var trialPeriod = TrialPeriod(timeTraverler.date)
        let newExpiredData = timeTraverler.timeTravelBy(days: 8)
        trialPeriod.reset()
        XCTAssertNotEqual(trialPeriod.expiredDate, newExpiredData)
    }
}
