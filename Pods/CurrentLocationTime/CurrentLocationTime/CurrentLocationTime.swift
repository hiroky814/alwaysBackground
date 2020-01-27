//
//  CurrentLocationTime.swift
//  CurrentLocationTime
//
//  Created by hiroki yoshida on 2020/01/17.
//  Copyright © 2020 hiroki yoshida. All rights reserved.
//
import Foundation

public func getTime(formatStr : String) -> String {
    let date = Date()
    let format = DateFormatter()
    format.locale = Locale(identifier: TimeZone.current.identifier)
    format.dateFormat = formatStr
    return format.string(from: date)
}
