//
//  FordsRewardsApp.swift
//  FordsRewards
//
//  Created by Christopher Walter on 4/20/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FordsRewardsApp: App {
    @StateObject var viewModel = AuthViewModel()
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

  var body: some Scene {
    WindowGroup {
        NavigationView {
            ContentView()
        }
      .environmentObject(viewModel)
      .environmentObject(DateHolder())
      .environmentObject(FirebaseViewModel())
      .environmentObject(UserInfo())

    }
  }
}
