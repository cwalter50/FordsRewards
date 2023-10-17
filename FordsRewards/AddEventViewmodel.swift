//
//  AddEventViewmodel.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/13/23.
//

import Foundation
import Firebase
import SwiftUI


class AddEventViewmodel: ObservableObject {
    let db = Firestore.firestore()
    @Published var eventName: String = ""
//    @Published var eventMonth: String = ""
//    @Published var eventDay: String = ""
//    @Published var eventYear: String = ""
    @Published var date: Date = Date()
    @Published var currentUser: UserInfo = UserInfo()
    
    init()
    {
        let id = currentUser.id
    }
    
    func saveEventDataToFirebase(event: EventInfo){

        db.collection("eventInfo").document(event.id).setData(event.toDictionaryValues()) {
            error in
            if let err = error {
                print(err)
            }
            else {
                print("Successfully added event \(event.id)")
            }
        }
        
    }
    
}
