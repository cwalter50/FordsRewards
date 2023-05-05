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
}
