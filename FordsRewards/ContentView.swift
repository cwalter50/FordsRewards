//
//  ContentView.swift
//  FordsRewards
//
//  Created by Christopher Walter on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        VStack {
            
GavinsScheduleView()
        
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateHolder())
    }
}
