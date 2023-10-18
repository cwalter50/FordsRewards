//
//  DateHolder.swift
//  FordsRewards
//
//  Created by  on 4/21/23.
//

import Foundation


/// it is, quite literally, just a date that is shared around.
class DateHolder: ObservableObject
{
    /// the date on the current page of the calendar
    @Published var date = Date()
}
