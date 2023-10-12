//
//  LoginView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/21/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject private var firebaseModel: FirebaseViewModel
    @State private var emailAddress: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack
        {
            Form
            {
                Section
                {
                    HStack
                    {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.fordsLightYellow)
                        
                        SuperTextField(
                            placeholder: Text("Email").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $emailAddress
                        ).foregroundColor(Color.fordsLightYellow)
                            .textContentType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                    }
                    
                    HStack
                    {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.fordsLightYellow)
                        
                        SuperTextFieldSecure(
                            placeholder: Text("Password").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $password
                        ).foregroundColor(Color.fordsLightYellow)
                            .textContentType(.password)
                            .keyboardType(.default)
                    }
                }.listRowBackground(Color.fordsRed)
                
                Section
                {
                    HStack
                    {
                        Spacer()
                        Button( action: {
                            authModel.signIn(emailAdress: emailAddress, password: password)
                        },
                                label: {
                            Text("Sign In")
                                .foregroundColor(Color.fordsYellow)
                                .bold()
                        })
                        Spacer()
                    }
                }.listRowBackground(Color.fordsRed)
                
                
                Section
                {
                    GoogleSignInButton(action: {
                        print("Hello")
                    }, signInView: false)
                }.listRowBackground(Color.fordsRed)
                
                Section
                {
                    ZStack {
                        NavigationLink (destination:
                            SignUpView()
                        ) {
                            HStack {
                                Text("Not a Member Yet? Sign Up!")
                                    .bold()
                            }
                        }.opacity(0)
                        
                        HStack {
                            Text("Not a Member Yet? Sign Up!")
                                .bold()
                        }.textColor(.fordsGold)
                    }
                }.listRowBackground(Color.fordsRed).buttonStyle(PlainButtonStyle())
            }.navigationTitle(Text("Login").textColor(.fordsGold))
                .scrollContentBackground(.hidden)
                .shadow(color: Color.fordsSelectedButtonRed, radius: 2.5, x: 5, y: 5)
                .alert(isPresented: $authModel.alertBool) {
                    Alert(title: Text("An Error Occured"), message: Text(authModel.errorMessage), dismissButton: .default(Text("Got it!")))
                }
        }.background(Color.fordsLightRed)
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
