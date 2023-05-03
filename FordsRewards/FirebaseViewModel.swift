//
//  FireBaseViewModel.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 5/3/23.
//

import Foundation
import Firebase

class FirebaseViewModel: ObservableObject
{
    
    init()
    {
        
    }
    func saveUserToFirebase(userInfo: UserInfo)
    {
        let db = Firestore.firestore()
        let data = userInfo.toDictionaryValues()
        db.collection("userInfo").document(userInfo.id).setData(data){
            error in
            if let err = error
            {
                print(err)
            }else
            {
                print("Successfully saved user info \(userInfo.id)")
            }
        }
    }
}
