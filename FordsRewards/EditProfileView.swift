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
    @State var image: UIImage?
    var body: some View {
        VStack
        {
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                VStack
                {
                    if let image  = self.image
                    {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .cornerRadius(64)
                    }else
                    {
                        Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                    }
                }.overlay(RoundedRectangle(cornerRadius: 64)
                    .stroke(Color.black, lineWidth: 3))
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
        }.popover(isPresented: $shouldShowImagePicker) {
            ImagePicker(image: $image)
        }
    }
}

//
//struct EditProfileView_Previews: PreviewProvider {
// static var previews: some View {
//   EditProfileView()
// }
//}
