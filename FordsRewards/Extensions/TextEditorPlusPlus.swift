//
//  TextEditorPlusPlus.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/17/23.
//

import SwiftUI

struct TextEditorPlusPlus: View {
    var text: Binding<String>
    
    let placeholder: String
    
    @FocusState var isFocused
    
    var body: some View {
        TextEditor(text: text)
        .overlay {
            if text.wrappedValue.count == 0  && !isFocused {
                HStack{
                    Button {
                        isFocused = true
                    } label: {
                        Text(placeholder)
                            .opacity(0.25)
                            .textColor(.primary)
                    }
                    Spacer()
                }
            }
        }.focused($isFocused)
    }
}

#Preview {
    TextEditorPlusPlus(text: .constant(""), placeholder: "what")
}
