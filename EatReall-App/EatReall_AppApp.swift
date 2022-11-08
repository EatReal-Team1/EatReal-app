//
//  EatReall_AppApp.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI
import Alamofire
import Firebase
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    print("starting firebase")
    firebaseDemo()
    
    return true
  }
}

@main
struct EatRealApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
