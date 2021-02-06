//
//  TrialPeriod.swift
//  TestingTimeTDD
//
//  Created by Osama Bashir on 2/6/21.
//  Copyright © 2021 Paul Solt. All rights reserved.
//

import Foundation

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
