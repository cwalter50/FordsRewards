//
//  CalendarCell.swift
//  FordsRewards
//
//  Created by  on 4/28/23.
//

import SwiftUI

struct CalendarCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    var month: MonthStruct
    var event: (CellLogView)? = nil
    
    var body: some View
    {
        if let forEvent = event {
            if isCurrentMonth(type: month.monthType){
                NavigationLink(destination: forEvent) {
                    Circle()
                        .fill(Color.fordsGold)
                        .scaleEffect(0.75)
                        .overlay {
                        Text(month.day())
                            .foregroundColor(colorText(type: month.monthType))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            } else {
                Circle()
                    .fill(circleColor(type: month.monthType))
                    .scaleEffect(0.75)
                    .overlay {
                    Text(month.day())
                        .foregroundColor(colorText(type: month.monthType))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        } else {
            Text(month.day())
                .foregroundColor(colorText(type: month.monthType))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
     
    }
    
    /// set the text color according to its `MonthType`
    func colorText(type: MonthType) -> Color
    {
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    /// checks if its the current month
    func isCurrentMonth(type: MonthType) -> Bool
    {
        return type == MonthType.Current
    }
    
    /// set the circle color
    func circleColor(type: MonthType) -> Color {
        return type == MonthType.Current ? Color.fordsGold : Color.gray.opacity(0.25)
    }
    
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(month: MonthStruct(count: 2, startingSpaces: 1, daysInMonth: 31, daysInPrevMonth: 31), event: CellLogView(month: MonthStruct(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)))
    }
}
