//
//  SignInView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/21/23.
//

import SwiftUI

struct SignInView: View {
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
            Button( action: {
                authModel.signIn(emailAdress: emailAddress, password: password) },
                    label: {
                Text("Sign In")
                    .bold()
            })
        }.navigationTitle("Sign In")

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
