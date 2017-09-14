//
//  Date+fromString.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    
    static func from(string: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        
        return formatter.date(from: string)
    }
}
