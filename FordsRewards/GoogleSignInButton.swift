//
//  GoogleSignInButton.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/24/23.
//

import SwiftUI

struct GoogleSignInButton: View {
    var action: () -> Void
    var signInView = true
    @EnvironmentObject private var authModel: AuthViewModel

    
    var body: some View {
        Button {
            print("Not working")
        } label: {
            HStack
            {
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                        .mask(
                            Circle()
                        )
                }.frame(width: 50, height: 50)
                if signInView
                {
                    Text("Sign Up With Google")
                        .foregroundColor(Color.fordsRed)
                }else
                {
                    Text("Login With Google")
                        .foregroundColor(Color.fordsRed)
                }
            }
            
        }
    }
}
