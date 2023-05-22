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
    @State var bio: String = ""
    @State var points: Int = 0
    var body: some View {
        NavigationView
        {
            VStack
            {
                HStack
                {
                    Image("fordslogo").resizable().scaledToFit().frame(width: 100).clipShape(Circle())
                    VStack(alignment: .center)
                    {
                        Text("\(displayname)").multilineTextAlignment(.center).font(.title)
                        Text("Points: \(points)")
                        Text("\(bio)").multilineTextAlignment(.center).italic()
                        
                    }
                }
                NavigationLink("Edit Profile")
                {
                    EditProfileView(displaynamereference: $displayname, bioreference: $bio)
                }.background(.blue).bold().foregroundColor(.white)
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
        ProfileView()
    }
}




