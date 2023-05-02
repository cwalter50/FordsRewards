//
//  HomeView.swift
//  FordsRewards
//
//  Created by  on 4/26/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    var body: some View {
        VStack {
                    Text("\(authModel.user?.email ?? "")")
        }
        .toolbar
                {
                    ToolbarItemGroup(placement: .navigationBarLeading) { Button(
                            action: { authModel.signOut()
                            }, label: {
                            Text("Sign Out") .bold()
                        })
                    }
                }
                .navigationTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .environmentObject(dev.authVM)
        }
    }
}
