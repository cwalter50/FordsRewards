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

    init()
    {
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
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
                            authModel.signUp( emailAddress: emailAddress, password: password)
                        },
                                label: {
                            Text("Sign Up")
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
                    }, signInView: true)
                }
            }.navigationTitle("Sign Up")
                .scrollContentBackground(.hidden)
                .background(Color.fordsLightRed)
                .shadow(color: Color.fordsSelectedButtonRed, radius: 2.5, x: 5, y: 5)
                .alert(isPresented: $authModel.alertBool) {
                    Alert(title: Text("An Error Occured"), message: Text(authModel.errorMessage), dismissButton: .default(Text("Got it!")))
                }
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
