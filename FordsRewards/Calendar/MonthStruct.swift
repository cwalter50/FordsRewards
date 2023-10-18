//
//  MonthStruct.swift
//  FordsRewards
//
//  Created by  on 4/28/23.
//

import Foundation
import SwiftUI


///Stores information about the current day in the month.
///
///this does NOT store information about *WHICH* month, or any information pertaining to a `Date`.
///it is *PURELY* a structure for containing the day of the month, and whether it should be grayed out when displayed in `GavinsSheduleView` (via a `MonthType`).
struct MonthStruct
{
    var monthType: MonthType
    var dayInt : Int
    
    /// get the current day index (1-31) as a string, for some reason.
    func day() -> String
    {
        return String(dayInt)
    }
    
    /// create a `MonthStruct` with a `MonthType` (previous, current, next) and day.
    init(monthType: MonthType, dayInt: Int) {
        self.monthType = monthType
        self.dayInt = dayInt
    }
    
    /// create a `MonthStruct` with the count, starting spaces, days in the current month, & days in previous the month.
    ///
    /// for clarification:
    /// - count is the result of `(rows * 7) + column`, or an index from like 0-42 or 1-43 or something.
    /// - starting spaces refers to the days before the start of the selected month, or the number of elements that are grayed out on the calendar.
    /// - check the `calendarView` member of `GavinsScheduleView` for more info / usage.
    ///
    init(count: Int, startingSpaces: Int, daysInMonth: Int, daysInPrevMonth: Int) {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
        var day = count - start
        
        if(day <= 0)
        {
            //let day = daysInPrevMonth + count - start
            day += daysInPrevMonth
            self = MonthStruct(monthType: MonthType.Previous, dayInt: day)
            return
        }
        else if (day > daysInMonth)
        {
            //let day = count - start - daysInMonth
            day -= daysInMonth
            self = MonthStruct(monthType: MonthType.Next, dayInt: day)
            return
        }
        
        self = MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
    
    /// determines the date of the cell RELATIVE TO a base date.
    ///
    /// details:
    /// - by "base date", im refering to a date that contains, at a minimum, the YEAR and MONTH to base this cell around.
    /// - generally, `relativeTo` should be `DateHolder.date`, especially when used in schedule view.
    /// - the return value of this function will have the month, day of month, and year, with the time set to 12:00AM. Weekday is naturally derived from those.
    /// - you can use `Calendar.current.component(...)` to get day/month/year from the date. some helper functions may be found in the `CalendarHelper` class.
    func dateOf(relativeTo: Date) -> Date {
        var value = 0
        
        switch monthType {
        case .Previous:
            value = -1
            break
            
        case .Current:
            value = 0
            break
            
        case .Next:
            value = 1
            break
        }
        
        let monthOf = Calendar.current.component(.month, from: relativeTo) + value
        let day = dayInt
        let year = Calendar.current.component(.year, from: relativeTo)
        
        return Calendar.current.date(from: DateComponents(year: year, month: monthOf, day: day)) ?? relativeTo
    }
}

/// stores whether a date is in the current month (black) or a previous/future month (grayed out)
enum MonthType
{
    case Previous
    case Current
    case Next
}

extension MonthType {
    /// convert to string string string string
    ///
    /// not a default `toString()` method from some silly protocol or anything, literally just a raw function to make it a string. \<\-\- you gotta call it yourself
    func toString() -> String {
        switch self {
        case .Previous:
            return "previous"
        case .Current:
            return "current"
        case .Next:
            return "next"
        }
    }
}
