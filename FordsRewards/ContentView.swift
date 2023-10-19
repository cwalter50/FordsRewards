//
//  ContentView.swift
//  FordsRewards
//
//  Created by Christopher Walter on 4/20/23.
//

import SwiftUI

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
        
    }
}

struct SuperTextFieldSecure: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            SecureField("", text: $text, onCommit: commit)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @AppStorage("signIn") var isSignIn = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.init(Color.fordsGold),
        ]
    }
    
    var body: some View {
        VStack {
            Group {
                NavigationView {
                    if authModel.user != nil || authModel.signedIn{
                        MainView()
                    } else {
                        LoginView()
                            .environmentObject(AuthViewModel())
                    }
                }.onAppear {
                    authModel.listenToAuthState()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateHolder())
            .environmentObject(dev.authVM)
            .environmentObject(FirebaseViewModel())
    }
}
