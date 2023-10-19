//
//  ProfileView.swift
//  FordsRewards
//
//  Created by Joseph McNicholas on 4/24/23.
//

//
//  ProfileView.swift
//  FordsRewards
//
//  Created by Joseph McNicholas on 4/20/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @State var displayname = ""
    @StateObject var Viewmodel = FirebaseViewModel()
    @State var bio: String = ""
    @State var points: Int = 0
    @Binding var title: String
    var body: some View {
        NavigationView
        {
            VStack
            {
                    Image("fordslogo").resizable().scaledToFit().frame(width: 100).clipShape(Circle())
                    VStack(alignment: .center)
                    {
                        
                        Text("\(Viewmodel.userInfo.firstName) \(Viewmodel.userInfo.lastName)").multilineTextAlignment(.center).font(.title)
                        Text("Points: \(points)")
                        
                        
                    }
                    .onAppear {
                        Viewmodel.retreiveUserData()
                        title = "Profile"
                    }
                NavigationLink("Edit Profile")
                {
                    EditProfileView(displaynamereference: $displayname, bioreference: $bio)
                }.foregroundColor(.fordsGold)
            }.toolbar
            {
                ToolbarItemGroup(placement: .navigationBarLeading) { Button(
                        action: { authModel.signOut()
                        }, label: {
                        Text("Sign Out") .bold()
                    })
                }
            }
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(title: .constant("ihjoieufh"))
    }
}




