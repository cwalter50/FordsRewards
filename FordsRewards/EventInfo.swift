//
//  EventInfo.swift
//  FordsRewards
//
//  Created by  on 4/28/23.
//

import Foundation
import SwiftUI
import Firebase

class EventInfo : ObservableObject, Identifiable
{
    
    @Published var name : String
    @Published var eventDate : Date
    @Published var location : String
    @Published var description : String
    @Published var creator : String //id of creator
    @Published var id: String
    @Published var created : Date
    
    init(name: String = "Empty Event", eventDate : Date, location : String = "", description : String = "", creator : String = "", id : String = "") {
        self.name = name
        self.eventDate = eventDate
        self.location = location
        self.description = description
        self.creator = creator
        self.created = Date()
        self.id = id
    }
    
    func toDictionaryValues() -> [String : Any] {
        return ["name" : self.name, "eventDate" : self.eventDate, "location" : self.location, "description" : self.description, "creator" : self.creator, "created" : self.created, "id" : self.id]
    }
    
    
    
}
