//
//  CalendarHelper.swift
//  FordsRewards
//
//  Created by  on 4/21/23.
//

import Foundation

class CalendarHelper
{
    /// current time or something...? unsure document later
    static let calendar = Calendar.current
    
    /// format the date
    static let dateFormatter = DateFormatter()
    
    /// turn date into month and year as string
    static func monthYearString(_ date: Date) -> String
    {
        dateFormatter.dateFormat = "LLL yyyy"
        return dateFormatter.string(from: date)
    }
    
    /// add one month
    static func plusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    /// subtract one month
    static func minusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    /// get the days in the current month
    static func daysInMonth(_ date: Date) -> Int
    {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    /// get the day of the month
    static func dayOfMonth(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    /// get the first of the month
    static func firstOfMonth(_ date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    /// get the day of the week
    static func weekDay(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
            return components.weekday! - 1
    }
    
}
