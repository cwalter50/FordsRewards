//
//  UserInfo.swift
//  FordsRewards
//
//  Created by  on 4/28/23.
//

import Foundation
import SwiftUI
import Firebase

class UserInfo : ObservableObject, Identifiable
{
    @Published var firstName : String
    @Published var lastName : String
    @Published var points : Int
    @Published var email : String
    @Published var id : String
    @Published var created : Date
    
    init(firstName: String = "", lastName: String = "", points: Int = 0, email: String = "", id: String = UUID().uuidString) {
        self.firstName = firstName
        self.lastName = lastName
        self.points = points
        self.email = email
        self.id = id
        self.created = Date()
    }
    
    init(data:[String: Any])
    {
        self.firstName = data["firstName"] as? String ?? "No First Name Retreived"
        self.lastName = data["lastName"] as? String ?? "No Last Name Retreived"
        self.points = data["points"] as? Int ?? 0
        self.email = data["email"] as? String ?? "No Email Retreived"
        self.id = data["id"] as? String ?? "No UID Retreived"
        self.created = (data["created"] as? Timestamp)?.dateValue() ?? Date()
    }
    
    func toDictionaryValues() -> [String : Any] {
        return ["id" : self.id, "firstName" : self.firstName, "lastName" : self.lastName, "points" : self.points, "email" : self.email, "created" : self.created]
    }
}
