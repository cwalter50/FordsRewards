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
    @State var title = ""

    var body: some View {
        
        TabView{
            HomeView(title: $title)
                .tabItem{
                Label("Home", systemImage: "house.fill")
            }
            
            GavinsScheduleView(title: $title)
                .tabItem{
                Label("Schedule", systemImage: "calendar")
            }
        
            ProfileView(title: $title)
                .tabItem{
                Label("Profile", systemImage: "person.fill")
            }
            
            ShopView(title: $title)
                .tabItem{
                Label("Shop", systemImage: "cart.circle")
                }
            
        }
        
        .navigationTitle("\(title)")
        .navigationBarTitleDisplayMode(.inline)
        
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
