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
    Database.database().isPersistenceEnabled = true
    
//    firebaseDemo()

    let exImage = UIImage(named: "placeholder-post")!
    let examplePreviewUser = PreviewUser(display_name: "Emily Feng", profile_picture: "profile/emily.JPG")
    let examplePost = Post(address: "", author: examplePreviewUser, food_photo: exImage, review_restaurant: "hunan")
    let rootRef = Database.database().reference()
    rootRef.child("Posts").child("4").setValue(
      [
        "address": examplePost.address,
        "author": examplePost.author.toAnyObject(),
        "food_photo": examplePost.food_photo.path,
        "review_restaurant": examplePost.review_restaurant
      ]
    )

    return true
  }
}

@main
struct EatReall_AppApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(ViewModel())
    }
  }
}
