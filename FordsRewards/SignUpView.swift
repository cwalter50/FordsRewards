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
    @State private var firstName: String = ""
    @State private var lastName: String = ""

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
                    //Email Textfield
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
                    //Password text feild
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
                    //First name text field
                    HStack
                    {
                        Image(systemName: "person.fill")
                            .foregroundColor(Color.fordsLightYellow)
                        
                        SuperTextField(
                            placeholder: Text("First Name").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $firstName
                        ).foregroundColor(Color.fordsLightYellow)
                            .textContentType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                        
                        //Last name text Field
                        SuperTextField(
                            placeholder: Text("Last Name").foregroundColor(Color.fordsLightYellowPlaceholder),
                            text: $lastName
                        ).foregroundColor(Color.fordsLightYellow)
                            .textContentType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                    }
                }.listRowBackground(Color.fordsRed)
                
                Section
                {
                    HStack
                    {
                        Spacer()
                        Button( action: {
                            authModel.signUp(
                                emailAddress: emailAddress,
                                password: password,
                                firstName: firstName,
                                lastName: lastName)
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
