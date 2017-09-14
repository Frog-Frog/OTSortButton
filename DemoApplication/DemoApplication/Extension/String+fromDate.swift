//
//  String+fromDate.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension String {
    
    static func from(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        
        
        return formatter.string(from: date)
    }
    
}
