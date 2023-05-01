//
//  SignUpView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/20/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @State private var emailAddress: String = ""
    @State private var password: String = ""


    
    var body: some View {
        Form
        {
            Section
            {
                TextField("Email", text: $emailAddress)
                    .foregroundColor(Color.fordsRed)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .foregroundColor(Color.fordsRed)
                    .textContentType(.password)
                    .keyboardType(.default)
            }
            
            Section
            {
                Button( action: {
                    authModel.signUp( emailAddress: emailAddress, password: password)
                },
                        label: {
                    Text("Sign Up")
                        .foregroundColor(Color.fordsOrange)
                        .bold()
                })
            }
            
            Section
            {
                NavigationLink( destination: {
                    LoginView()
                }, label:
                {
                    Text("Already a Member? Login")
                        .foregroundColor(Color.fordsRed)
                })
            }
        }.navigationTitle("Sign Up")
            .scrollContentBackground(.hidden)
            .background(Color.fordsLightRed)
            .alert(isPresented: $authModel.alertBool) {
                Alert(title: Text("An Error Occured"), message: Text(authModel.errorMessage), dismissButton: .default(Text("Got it!")))
                    }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }.navigationTitle("Sign Up View")
            .environmentObject(dev.authVM)
    }
}
