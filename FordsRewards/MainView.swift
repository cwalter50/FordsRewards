//
//  MainView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/20/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var authModel: AuthViewModel

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
        
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainView()
                .environmentObject(dev.authVM)
        }
    }
}
