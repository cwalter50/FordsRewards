//
//  DeprecatedTextFeatures.swift
//  FordsRewards
//
//  Created by Michael Potter on 10/11/23.
//

import Foundation
import SwiftUI

extension Text {
    /// Handles setting text color, despite version discrepencies.
    func textColor(_ color: Color) -> Text {
        if #available(iOS 17, *) {
            return self.foregroundStyle(color) as! Text 
        } else {
            return self.foregroundColor(color)
        }
    }
}

extension View {
    /// Handles setting text color, despite version discrepencies.
    func textColor(_ color: Color) -> some View {
        if #available(iOS 17, *) {
            return self.foregroundStyle(color)
        } else {
            return self.foregroundColor(color)
        }
    }
}
