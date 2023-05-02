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
                
                Text(CalendarHelper().monthYearString(dateHolder.date))
                    .font(.title)
                    .bold()
                    .animation(.none)
                    .frame(maxWidth: .infinity)

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
    
    func previousMonth()
    {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth()
    {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
    
    
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
            .environmentObject(DateHolder())
    }
}
