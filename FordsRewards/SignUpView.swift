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
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .keyboardType(.default)
            }
            
            Section
            {
                Button( action: {
                    authModel.signUp( emailAddress: emailAddress, password: password) },
                        label: {
                    Text("Sign Up")
                        .bold()
                })
            }
            
            Section
            {
                NavigationLink( destination: {
                    SignInView()
                }, label:
                {
                    Text("Already a Member? Sign In")
                })
            }
        }.navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }.navigationTitle("Sign Up View")
    }
}
