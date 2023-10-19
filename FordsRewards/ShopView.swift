//
//  ShopView.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/19/23.
//

import SwiftUI

struct ShopView: View {
    @Binding var title: String
    var body: some View {
        VStack{
            
        }.onAppear{
            title = "Shop"
        }
    }
}

#Preview {
    ShopView(title: .constant("weorbf"))
}
