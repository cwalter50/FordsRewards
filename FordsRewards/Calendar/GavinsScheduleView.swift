//
//  ContentView.swift
//  Hpride Authentication
//
//  Created by  on 4/19/23.
//

import SwiftUI

/// really sick calendar. its pretty good. does some stuff.
struct GavinsScheduleView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    @Binding var title: String
    
    /// DO NOT BE FOOLED
    /// -- this is what is drawn, not just `calendarGrid`
    var body: some View
    {
        VStack(spacing: 1){
            DateScrollerView()
                .padding()
            
            dayOfWeekStack // defined below
            
            calendarGrid // defined below
        }.onAppear {
            title = "Calendar"
        }
    }
    
    /// top bar containing days of week
    var dayOfWeekStack: some View
    {
        HStack(spacing: 1)
        {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thur").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
            
            
        }
    }
    
    /// contains every date within the calendar page
    var calendarGrid: some View
    {
        VStack(spacing: 1)
        {
            let daysInMonth = CalendarHelper.daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper.firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper.weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper.minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper.daysInMonth(prevMonth)
            
            ForEach(0..<6)
            {
                row in
                HStack(spacing: 1)
                {
                    ForEach(1..<8)
                    {
                        column in
                        
                        let count = column + (row * 7)
                        let mth = MonthStruct(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth);
                        
                        CalendarCell(month: mth)
                        
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}
    
    
struct GavinsScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        GavinsScheduleView(title: .constant(""))
            .environmentObject(DateHolder())
    }
}

extension Text{
    /// predifned styles for the days of the week within `GavinsScheduleView`.
    ///
    /// includes:
    /// - bold
    /// - padding
    /// - line limit
    /// - how silly!!!
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
            .bold()
    }
}
