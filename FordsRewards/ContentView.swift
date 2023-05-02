//
//  ContentView.swift
//  FordsRewards
//
//  Created by Christopher Walter on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.fordsGold)]
    }
    
    var body: some View {
        VStack {
            Group {
            if authModel.user != nil {
                MainView()
            } else {
                SignUpView()
                    .environmentObject(AuthViewModel())
            }
            }.onAppear {
            authModel.listenToAuthState()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateHolder())
            .environmentObject(dev.authVM)
    }
}
