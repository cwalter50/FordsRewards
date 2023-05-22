//
//  MainView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/20/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject var dateHolder: DateHolder


    var body: some View {
        
        TabView{
            HomeView()
                .tabItem{
                Label("Home", systemImage: "house.fill")
            }
            
            GavinsScheduleView()
                .tabItem{
                Label("Schedule", systemImage: "calendar")
            }
        
            ProfileView()
                .tabItem{
                Label("Profile", systemImage: "person.fill")
            }
            
        }
        .navigationTitle("Home")
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainView()
                .environmentObject(dev.authVM)
                .environmentObject(DateHolder())
                .environmentObject(FirebaseViewModel())
        }
    }
}
