//
//  AddEventView.swift
//  FordsRewards
//
//  Created by  on 5/4/23.
//

import SwiftUI
import Firebase

struct AddEventView: View {
    @State var name = ""
    @State var description = ""
    @State var location = ""
    @State var eventDate : Date = Date()
    @EnvironmentObject var firebaseVM: FirebaseViewModel

    var body: some View {
        ZStack {
            
            Color.fordsLightRed
            VStack
            {
                Image("fordsAthletics")
                    .resizable()
                    .frame(width: 100,height: 110)
                Section
                {
                    HStack
                    {
                        
                        
                        
                        SuperTextField(
                            placeholder: Text("Event Name").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $name
                        ).foregroundColor(Color.fordsLightYellow)
                            .font(.title.bold())
                    }.padding()
                    
                    HStack
                    {
                        
                        SuperTextField(
                            placeholder: Text("Location").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $location)
                        .foregroundColor(Color.fordsLightYellow)
                            .font(.title.bold())
                    }.padding()
                    
                    HStack
                    {
                        SuperTextField(
                            placeholder: Text("Event Desciption").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $description)
                            .foregroundColor(Color.fordsLightYellow)
                            .font(.title.bold())
                    }.padding()
                }
                
                
                
                
                
                
                DatePicker(selection: $eventDate, in: ...Date.distantFuture, displayedComponents: .date, label: { Text("Date and Time") })
                    .foregroundColor(.fordsBlack)
                    .font(.title.bold())
                    .colorInvert()
                    .colorMultiply(Color.white)
                    .padding()
                Spacer()
                
                
                Button {
                    
                    saveNewEvent()
                } label: {
                    
                    Text("Add Event")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.fordsBlack)
                        .font(.title.bold())
                       
                }
                .disabled(name == "" || description == "" || location == "")
                Spacer()
                
                
                
            }
        }
        .navigationTitle("Add An Event")
        .background(Color.fordsLightRed)
        
    }
    
        func saveNewEvent()
        {
            let id = UUID().uuidString
    
            let newEvent = EventInfo(name: name, eventDate: eventDate, location: location, description: description, creator: "Gavin", id: id)
             
            firebaseVM.saveEventDataToFirebase(event: newEvent)
            
            
        }
}
    
    struct AddEventView_Previews: PreviewProvider {
        static var previews: some View {
            AddEventView()
                .environmentObject(FirebaseViewModel())
        }
    }

