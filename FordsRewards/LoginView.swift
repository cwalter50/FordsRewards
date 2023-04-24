//
//  LoginView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/21/23.
//

import SwiftUI

struct LoginView: View {
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
                    authModel.signIn(emailAdress: emailAddress, password: password) },
                        label: {
                    Text("Login")
                        .foregroundColor(Color.fordsOrange)
                        .bold()
                })
            }
        }.navigationTitle("Login")
            .scrollContentBackground(.hidden)
            .background(Color.fordsLightRed)
            .alert(isPresented: $authModel.alertBool) {
                Alert(title: Text("An Error Occured"), message: Text(authModel.errorMessage), dismissButton: .default(Text("Got it!")))
                    }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            LoginView()
        }.navigationTitle("Login")
            .environmentObject(dev.authVM)
    }
}
