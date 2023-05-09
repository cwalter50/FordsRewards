//
//  FirebaseViewModel.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 5/4/23.
//

import Foundation
import Firebase
import SwiftUI

class FirebaseViewModel: ObservableObject
{
    @Published var userInfo = UserInfo()
    
    let db = Firestore.firestore()

    func saveUserDataToDatabase(userInfo: UserInfo)
    {

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
    
    func retreiveUserData()
    {
        guard let user = Auth.auth().currentUser else
        {
            print("No Current User")
            return
        }
        
        db.collection("userInfo").document("\(user.uid)")
            .getDocument(completion:
                            { (snapshot, error) in
                if let err = error
                {
                    print(err)
                }else
                {
                    if let snap = snapshot
                    {
                        self.userInfo = UserInfo(snapshot: snap)
                                                
                        //print("\(firstName) \(lastName) \(points) \(email) \(id) \(created)")
                    }
                    return
                }
            }
            )
    }
}
