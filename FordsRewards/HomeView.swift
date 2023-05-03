//
//  HomeView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 5/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        VStack {
                    Text("\(authModel.user?.email ?? "")")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
