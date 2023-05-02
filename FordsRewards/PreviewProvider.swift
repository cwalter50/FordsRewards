//
//  PreviewProvider.swift
//  FordsRewards
//
//  Created by Michael Dougherty on 4/24/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

extension PreviewProvider
{
    static var dev: DeveloperPreview
    {
        return DeveloperPreview.instance
    }
}


class DeveloperPreview
{
    static let instance = DeveloperPreview()
    private init() {}
    
    let authVM = AuthViewModel()
    
}
