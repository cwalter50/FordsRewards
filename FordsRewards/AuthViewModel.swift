//
//  AuthViewModel.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/20/23.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Firebase
import GoogleSignIn

class AuthViewModel: ObservableObject {
    
    @Published var alertBool: Bool = false
    @Published var errorMessage: String = ""
    @Published var signedIn = false


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
        password: String,
        firstName: String,
        lastName: String
    ) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let err = error
            {
                self.alertCheck()
                self.errorMessage = "\(err.localizedDescription)"
                print("An Error Occured: \(err.localizedDescription)")
                return
            }
            
//            guard let _ = result?.user else
//            {
//                
//            }
            
//            Auth.auth().currentUser?.sendEmailVerification { error in
//                if let err = error
//                {
//                    print("An Error Occured \(err.localizedDescription)")
//                    return
//                }
//            }
            
            let newUser = UserInfo(firstName: firstName, lastName: lastName, points: 0, email: emailAddress, id: "\(self.user?.uid ?? "")")
            let firebaseViewModel = FirebaseViewModel()
            firebaseViewModel.saveUserDataToDatabase(userInfo: newUser)
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
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func alertCheck()
    {
        alertBool.toggle()
    }
    
    
}
