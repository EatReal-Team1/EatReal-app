//
//  EatReall_AppApp.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI
import Alamofire
import Firebase
import FirebaseStorage
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    firebaseDemo()

    let exampleImage = UIImage(named: "group_pic.png")
    let exampleUser = PreviewUser(display_name: "Leanne Sun", profile_picture: "placeholer.pic")
    let examplePost = Post(address: "123 Main St", author: exampleUser, food_photo: "Sources/group_pic.png", review_restaurant: "This is a test")

    examplePost.uploadImage(imageType: "example", image: exampleImage!)

    return true
  }
}

@main
struct EatReall_AppApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
