//
//  ContentView.swift
//  Hpride Authentication
//
//  Created by  on 4/19/23.
//

import SwiftUI

struct GavinsScheduleView: View {
    var body: some View {
        VStack {
            
            Text("FORDS SCHEDULE")
                .font(.custom(
                        "AmericanTypewriter",
                        fixedSize: 36))
                .foregroundColor(.red)
            
            HStack{
                
Button("September") {
    
        }
                
                
        Button("October") {
                    
        }
                
                Button("November") {
                    
                }
                
                    Button("December") {
                    
                    }
                
            }
            .frame(minWidth: 400, maxHeight: 1000)
            .font(.system(size: 20))
                
            HStack{
                Text("H")
                
                    .font(.system(size: 100))
                    .padding()
                    .background(.red)
                        .foregroundColor(.yellow)

                VStack{
                    
                    Color.red
                        .frame(width: 1000, height: 10)
                        
                    
                    Color.yellow
                        .frame(width: 1000, height: 10)
                        
                    
                }
                    
                    
                    Text("Pride")
                    .font(.system(size: 100))
                    .background(.red)
                        .foregroundColor(.yellow)

                
                
            }
           
            
            HStack{
                
    Button("January") {
                        
        }
                
        Button("February") {
                    
        }
                
            Button("March") {
                    
            }
                
                Button("April") {
                    
                }
                
                    Button("May") {
                    
                    }
                
                        Button("June") {
                    
                            }
                
            }
            .frame(minWidth: 400, maxHeight: 1000)
            .font(.system(size: 20))
            .padding()
            
            
            
        }
        .padding()
    }
}

struct GavinsScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        GavinsScheduleView()
    }
}

