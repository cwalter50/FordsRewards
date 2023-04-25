//
//  ContentView.swift
//  Hpride Authentication
//
//  Created by  on 4/19/23.
//

import SwiftUI

struct GavinsScheduleView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    
    var body: some View
    {
        VStack(spacing: 1){
            
            DateScrollerView()
                .padding()
            dayOfWeekStack
          
            
        }
    }
    
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
}
    
    
    struct GavinsScheduleView_Previews: PreviewProvider {
        static var previews: some View {
            GavinsScheduleView()
                .environmentObject(DateHolder())
        }
    }

extension Text{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
