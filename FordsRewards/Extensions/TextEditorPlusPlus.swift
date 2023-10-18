//
//  TextEditorPlusPlus.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/17/23.
//

import SwiftUI

/// A wrapper for `TextEditor` that allows for an (albeit somewhat janky) placeholder to be
/// put above the field when empty.
///
/// notes:
/// - yes, the text does have to disappear when you click it. otherwise, it renders above and to the left of the cursor.
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

struct TextEditorPlusPlus_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorPlusPlus(text: .constant(""), placeholder: "testing")
    }
}
