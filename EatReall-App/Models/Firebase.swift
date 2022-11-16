//
//  Firebase.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/8/22.
//

import SwiftUI
import Alamofire
import Firebase
import Foundation

func firebaseDemo() {
  Database.database().isPersistenceEnabled = true
  let rootRef = Database.database().reference()

//  rootRef.child("Users").getData(completion:  { error, snapshot in
//    guard error == nil else {
//      print(error!.localizedDescription)
//      return;
//    }
//    let userName = snapshot?.value as? String ?? "Unknown"
//  })
  
  rootRef.child("Users").observe(.value, with: { snapshot in
    var users: [User] = []
    for child in snapshot.children {
      if let snapshot = child as? DataSnapshot,
        let user = User(snapshot: snapshot) {
        users.append(user)
      }
    }
    print("Users: \(users.count)")
    for user in users {
      print("display_name: \(user.display_name)")
      print("username: \(user.username)")
      print("profile_picture: \(user.profile_picture)")
//      print("followers: \(user.followers)")
//      print("following: \(user.following)")
    }
  })
  print("\n")

  rootRef.child("Posts").observe(.value, with: { snapshot in
    var posts: [Post] = []
    for child in snapshot.children {
      print("loading post")
      if let snapshot = child as? DataSnapshot,
        let post = Post(snapshot: snapshot) {
        posts.append(post)
      }
    }
    print("Posts: \(posts.count)")
    for post in posts {
      print("address: \(post.address)")
      print("author: \(post.author)")
      print("food_photo: \(post.food_photo)")
      print("selfie_photo: \(post.selfie_photo)")
      print("review_restaurant: \(post.review_restaurant)")
      print("review_dish: \(post.review_dish)")
      print("review_comment: \(post.review_comment)")
      print("review_stars: \(post.review_stars)")
      print("reviewed: \(post.reviewed)")
      print("likes: \(post.likes)")
    }
  })
}
