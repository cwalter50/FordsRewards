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
    @Published var role: String
    
    // Starts making the variables that are attached to each user
    init(firstName: String = "", lastName: String = "", points: Int = 0, email: String = "", id: String = UUID().uuidString, role: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.points = points
        self.email = email
        self.id = id
        self.created = Date()
        self.role = role
    }
    // Checks to see if the user has all the data and if not then sets it to No _ Retrieved
    init(data:[String: Any])
    {
        self.firstName = data["firstName"] as? String ?? "No First Name Retreived"
        self.lastName = data["lastName"] as? String ?? "No Last Name Retreived"
        self.points = data["points"] as? Int ?? 0
        self.email = data["email"] as? String ?? "No Email Retreived"
        self.id = data["id"] as? String ?? "No UID Retreived"
        self.created = (data["created"] as? Timestamp)?.dateValue() ?? Date()
        self.role = data["role"] as? String ?? "No Role Retrieved"
    }
    // Initializes the values and sets the default parameters
    func toDictionaryValues() -> [String : Any] {
        return ["id" : self.id, "firstName" : self.firstName, "lastName" : self.lastName, "points" : self.points, "email" : self.email, "created" : self.created, "role" : "student"]
    }
}
