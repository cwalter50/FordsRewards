//
//  EventView.swift
//  FordsRewards
//
//  Created by  on 4/25/23.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        
        VStack {
            
            Text("Event Name")
                .font(.system(size: 50))
            Text("4/24/23")
            Text("Image:")
                .padding()
            Spacer()
            Text("Location")
            
                .font(.system(size: 25))
            Text("Haverford HighSchool")
            Text("Notes about event:")
                .font(.system(size: 20))
                .padding()
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.gray)
                .frame(width: 400, height: 150)
            
            
                .overlay(
                    Text("*'This event is'*")
                    
                )
            Text("Creators:")
            Text("Eric...")
            
            
            
            
            
        }
        .padding()
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
