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
    
    func toDictionaryValues() -> [String : Any] {
        return ["id" : self.id, "firstName" : self.firstName, "lastName" : self.lastName, "points" : self.points, "email" : self.email, "id" : self.id, "created" : self.created]
    }
}
