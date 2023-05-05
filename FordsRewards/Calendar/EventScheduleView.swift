//
//  EventScheduleView.swift
//  FordsRewards
//
//  Created by  on 5/3/23.
//

import SwiftUI

struct EventScheduleView: View {
    @State var eventName = ""
    @State var description = ""

    var body: some View {
       
        VStack{
            
            HStack{
            
                    NavigationLink {
                        AddEventView()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.fordsWhite)
                    }
                    .padding()
                Spacer()
                }
            Spacer()
            }
    
                .navigationTitle("Events")                .background(Color.fordsLightRed)
        
        
    }
    

}
    struct EventScheduleView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                EventScheduleView()
            }
        }
    }

