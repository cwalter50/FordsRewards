//
//  EditProfileView.swift
//  FordsRewards
//
//  Created by Joseph McNicholas on 4/24/23.
//

//
//  EditProfileView.swift
//  FordsRewards
//
//  Created by Joseph McNicholas on 4/20/23.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var displaynamereference: String
    @Binding var bioreference: String
    var body: some View {
        VStack
        {
            HStack
            {
                Text("Change Display Name: ")
                TextField("\(displaynamereference)", text: $displaynamereference).border(.black)
            }
            HStack
            {
                Text("Change Bio: ")
                TextField("\(bioreference)", text: $bioreference).border(.black)
            }
        }
    }
}
//struct EditProfileView_Previews: PreviewProvider {
// static var previews: some View {
//   EditProfileView()
// }
//}
