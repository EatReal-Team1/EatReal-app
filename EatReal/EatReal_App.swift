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

//    let exImage = UIImage(named: "placeholder-post")!
//    let examplePreviewUser = PreviewUser(display_name: "Emily Feng", profile_picture: "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/profile%2Femily.JPG?alt=media&token=c2a7afd1-35eb-4584-b21f-187c4d6e8f95")
//    Task {
//      let examplePost = await Post(address: "", author: examplePreviewUser, food_photo: exImage, review_restaurant: "hunan")
//      print("created post")
//      let rootRef = Database.database().reference()
//      try await rootRef.child("Posts").child("4").setValue(
//        [
//          "address": examplePost.address,
//          "author": examplePost.author.toAnyObject(),
//          "food_photo": examplePost.food_photo,
//          "review_restaurant": examplePost.review_restaurant
//        ]
//      )
//    }

    return true
  }
}

@main
struct EatReal_App: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @StateObject var viewRouter = ViewRouter()
  var body: some Scene {
    WindowGroup {
      ContentView(viewRouter: ViewRouter())
        .environmentObject(ViewModel())
    }
  }
}
