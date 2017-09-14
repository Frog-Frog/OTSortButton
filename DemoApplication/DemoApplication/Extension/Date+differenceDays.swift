//
//  Date+differenceDays.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    
    static func difference(days: Int, from:Date) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(byAdding: .day, value: days, to: calendar.startOfDay(for: from))
    }
}
