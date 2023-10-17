//
//  Addevents.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/12/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseCore

struct Addevents: View
{
    @Environment(\.dismiss) var dismiss
    @State var eventName: String = ""
    @State var eventLocation: String = ""
    @State var eventDescription: String = ""
    @StateObject var viewModel = AddEventViewmodel()
    
    @State var unfinished = false
    @State var finished = false
    
    
    var body: some View
    {
            ZStack
            {
                Form
                {
                    Section
                    {
                        DatePicker("Select the date:", selection: $viewModel.date)
                            .tint(.fordsGold)
                            .textColor(Color.fordsGold)
                            .bold()
                            .datePickerStyle(.graphical)
                    }
                    
                    
                    Section
                    {
                        TextField(
                            "EventName",
                            text: $eventName,
                            prompt: Text("Event Name")
                        )
                        .tint(.fordsYellow)
                        .textColor(Color.fordsGold)
                        .textFieldStyle(.plain)
                    }
                    
                    Section
                    {
                        TextField(
                            "EventLocation",
                            text: $eventLocation,
                            prompt: Text("Event Location")
                        )
                        .tint(.fordsYellow)
                        .textColor(Color.fordsGold)
                        .textFieldStyle(.plain)
                    }
                    
//                    Section
//                    {
//                        TextField(
//                            "EventDescription",
//                            text: $eventDescription,
//                            prompt: Text("Event Description"),
//                            axis: .vertical
//                        )
//                        .tint(.fordsYellow)
//                        .textColor(Color.fordsGold)
//                        .textFieldStyle(.plain)
//                    }
                    
                    Section 
                    {
//                            TextEditor(text: $eventDescription)
//                            .overlay {
//                                if eventDescription.count == 0  && !focused {
//                                    HStack{
//                                        Button {
//                                            focused = true
//                                        } label: {
//                                            Text("Event Description")
//                                                .opacity(0.25)
//                                                .textColor(.primary)
//                                        }
//                                        Spacer()
//                                    }
//                                }
//                            }.focused($focused)
                        
                        TextEditorPlusPlus(text: $eventName, placeholder: "Event Description")
                    }
                    
                    let adde = EventInfo(name: eventName, eventDate: viewModel.date, location: eventLocation, description: eventDescription, creator: viewModel.currentUser.firstName+" "+viewModel.currentUser.lastName, id: (UUID().uuidString))
                    
                    Section
                    {
                        Button(action: {
                            if eventName=="" && eventLocation=="" && eventDescription==""{
                                unfinished = true
                            }
                            else {
                                viewModel.saveEventDataToFirebase(event: adde)
                                //                dismiss()
                                finished = true
                                
                                eventName = ""
                                eventLocation = ""
                                eventDescription = ""
                            }
                        })
                        {
                            HStack {
                                Spacer()
                                Text("Add event")
                                    .textColor(Color.fordsGold)
                                    .bold()
                                Spacer()
                            }
                        }
                    }
                }
            }
            .alert("Invalid Fields", isPresented: $unfinished) {
                Button("Ok") {
                    unfinished = false
                }
            }
            .alert("Event Created", isPresented: $finished) {
                Button("Ok") {
                    finished = false
                    dismiss()
                }
            }
        }
    }


#Preview {
    Addevents()
}
