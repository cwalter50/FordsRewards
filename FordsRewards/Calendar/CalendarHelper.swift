//
//  CalendarHelper.swift
//  FordsRewards
//
//  Created by  on 4/21/23.
//

import Foundation

/// a lot, and i mean a LOT of helper functions for working with dates
///
/// notes:
/// - most of the stuff relating to `GavinsScheduleView` implements these functions in some way
class CalendarHelper
{
    /// calendar object. used to mutilate dates.
    static let calendar = Calendar.current
    
    /// format the date
    static let dateFormatter = DateFormatter()
    
    /// turn date into month and year as string
    static func monthYearString(_ date: Date) -> String
    {
        dateFormatter.dateFormat = "LLL yyyy"
        return dateFormatter.string(from: date)
    }
    
    /// converts a function to month, day, and year (in that order)
    ///
    /// notes:
    /// - `MonthStruct.dateOf(...)` does NOT rely on this, it implements it itself
    /// - might want to fix that later idk
    static func toMDY(_ date: Date) -> (Int, Int, Int) {
        let m = calendar.component(.month, from: date)
        let d = calendar.component(.day, from: date)
        let y = calendar.component(.year, from: date)
        
        return (m, d, y)
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
    ///
    /// notes:
    /// - not entirely sure why but it subtracts 1 from the weekday before returning
    /// - ACTUALLY WAIT THAT MIGHT BE TO OFFSET IT BC THE CALENDAR GOES FROM SUN-SAT OHHHHHH
    static func weekDay(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
            return components.weekday! - 1
    }
    
}
