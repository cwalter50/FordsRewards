//
//  mw_CellLogView.swift
//  FordsRewards
//
//  Created by Milo Woodman on 10/13/23.
//

import SwiftUI

/// this view should *NOT* be used in normal circumstances.
///
/// this view was more or less a test to figure out how (and even if) you could retreive a date
/// from a calender cell.
///
/// turns out, you can!  you can find it as `MonthStruct.dateOf(...)`
struct CellLogView: View {
    let month: MonthStruct
    var date: Date = Date()
    
    @State var silly = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Day: \(month.dayInt), Type: \(month.monthType.toString())")
            }
            
            Text("Date(?): \(month.dateOf(relativeTo: date))")
            
        }
    }
}

struct CellLogView_Previews: PreviewProvider {
    static var previews: some View {
        CellLogView(month: MonthStruct(monthType: .Next, dayInt: 31))
    }
}
