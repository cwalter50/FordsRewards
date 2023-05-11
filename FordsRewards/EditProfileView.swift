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
    @State var shouldShowImagePicker: Bool = false
    var body: some View {
        VStack
        {
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                Image(systemName: "person.fill")
                    .font(.system(size: 64))
            }

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
