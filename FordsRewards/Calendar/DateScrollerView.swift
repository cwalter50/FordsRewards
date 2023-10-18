//
//  DateScrollerView.swift
//  FordsRewards
//
//  Created by  on 4/21/23.
//

import SwiftUI

struct DateScrollerView: View
{
    @EnvironmentObject var dateHolder: DateHolder

    var body: some View
    {
        
        VStack {
            HStack{
                Spacer()

                Button(action: previousMonth)
                {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .font(Font.title.weight(.bold))
                }
                
                Button(action: resetMonth)
                {
                    Text(CalendarHelper.monthYearString(dateHolder.date))
                        .font(.title)
                        .bold()
                        .animation(.none)
                        .frame(maxWidth: .infinity)
                }.foregroundColor(.primary)

                Button(action: nextMonth)
                {
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                        .font(Font.title.weight(.bold))
                }
                Spacer()
            }
        }
        
        
    }
    
    /// move back one month
    func previousMonth()
    {
        dateHolder.date = CalendarHelper.minusMonth(dateHolder.date)
    }
    
    /// reset the month back to the current month
    func resetMonth()
    {
        dateHolder.date = Date();
    }
    
    /// move forward one month
    func nextMonth()
    {
        dateHolder.date = CalendarHelper.plusMonth(dateHolder.date)
    }
    
    
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
            .environmentObject(DateHolder())
    }
}
