//
//  AuthViewModel.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/20/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class AuthViewModel: ObservableObject {
    @Published var alertBool: Bool = false
    @Published var errorMessage: String = ""
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
            
        }
    }
    
    func signUp(
        emailAddress: String,
        password: String
    ) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                self.alertCheck()
                self.errorMessage = "\(error.localizedDescription)"
                print("An Error Occured: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signIn(
        emailAdress: String,
        password: String
    ){
        Auth.auth().signIn(withEmail: emailAdress, password: password) { result, error in
            if let error = error {
                self.alertCheck()
                self.errorMessage = "\(error.localizedDescription)"
                print("An Error Occured: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func alertCheck()
    {
        alertBool.toggle()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
