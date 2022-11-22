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
  let rootRef = Database.database().reference()

  rootRef.child("Users").getData(completion:  { error, snapshot in
    guard error == nil else {
      print(error!.localizedDescription)
      return;
    }
    let userName = snapshot?.value as? String ?? "Unknown"
  })
  
//  var userSnapshots: [DataSnapshot] = []
//  var users: [User] = []
//
//  rootRef.child("Users").observe(.value, with: { snapshot in
//    for child in snapshot.children {
//      if let snapshot = child as? DataSnapshot {
//        userSnapshots.append(snapshot)
//      }
//    }
//  })
//
//  for snapshot in userSnapshots{
//    if let user = await User(snapshot: snapshot) {
//      users.append(user)
//    }
//  }
  
  var viewModel = ViewModel()
  var users = viewModel.userList
  print("Users: \(users.count)")
  for user in users {
    print("display_name: \(user.display_name)")
    print("username: \(user.username)")
    print("profile_picture: \(user.profile_picture)")
  }
  print("\n")

//  var posts: [Post] = []
//  var postSnapshots: [DataSnapshot] = []
//  rootRef.child("Posts").observe(.value, with: { snapshot in
//    for child in snapshot.children {
//      print("loading post")
//      if let snapshot = child as? DataSnapshot{
//        postSnapshots.append(snapshot)
//      }
//    }
//  })
//
//  for ss in postSnapshots {
//    if let post = await Post(snapshot: ss) {
//      posts.append(post)
//    }
//  }
  
  var posts = viewModel.postList
  print("Posts: \(posts.count)")
  for post in posts {
    print("address: \(post.address)")
    print("author: \(post.author.display_name)")
    print("author_profile_url: \(post.author.profile_picture)")
    print("food_photo: \(post.food_photo)")
    print("selfie_photo: \(post.selfie_photo)")
    print("review_restaurant: \(post.review_restaurant)")
    print("review_dish: \(post.review_dish)")
    print("review_comment: \(post.review_comment)")
    print("review_stars: \(post.review_stars)")
    print("reviewed: \(post.reviewed)")
    print("likes: \(post.likes)")
  }
}

