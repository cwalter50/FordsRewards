//
//  FirebaseViewModel.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 5/4/23.
//

import Foundation
import Firebase

class FirebaseViewModel: ObservableObject
{
    let db = Firestore.firestore()

    func saveUserDataToDatabase(userInfo: UserInfo)
    {
        let db = Firestore.firestore()
        db.collection("userInfo").document(userInfo.id).setData(userInfo.toDictionaryValues())
        {
            error in
            if let err = error {
                print(err)
            }
            else {
                print("Succsessfully saved user data to firebase")
            }
        }
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
