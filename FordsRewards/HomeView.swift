//
//  HomeView.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 5/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject private var firebaseVM: FirebaseViewModel
//    @ObservedObject var userInfo: UserInfo
//    @State var firstName: String = ""
//    @State var lastName: String = ""
//    @State var points: Int = 0
//    @State var email: String = ""
//    @State var id: String = ""
//    @State var created: Date = Date()
    
    var body: some View {
        
        VStack {
            List
            {
                Text("\(firebaseVM.userInfo.firstName)")
                Text("\(firebaseVM.userInfo.lastName)")
                Text("\(firebaseVM.userInfo.points)")
                Text("\(firebaseVM.userInfo.email)")
                Text("\(firebaseVM.userInfo.id)")
                Text("\(firebaseVM.userInfo.created)")
            }
        }
        .onAppear(perform: readUser)
    }
    func readUser()
    {
        firebaseVM.retreiveUserData()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
