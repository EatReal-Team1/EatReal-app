//
//  CameraViewController.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI
import Firebase

class ViewModel: ObservableObject {
  @Published var rootRef: DatabaseReference
  @Published var image: UIImage?
  @Published var showPicker = false
  @Published var selectedPost: Post?
  @Published var reviewingPost: Post?
  
  @Published var postList: [Post]
  @Published var numPosts: Int
  @Published var userList: [User]
  @Published var numUsers: Int
  @Published var currentUser: PreviewUser
  
//  var rootRef: DatabaseReference! = Database.database().reference()
  
  init() {
    self.rootRef = Database.database().reference()
//    self.rootRef = FirebaseDatabase.Database.database().reference()
    self.postList = []
    self.numPosts = 0
    self.userList = []
    self.numUsers = 1
    self.currentUser = PreviewUser(display_name: "fake user", profile_picture: "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/reaction%2Femily_and_chicken.jpeg?alt=media&token=cff5f474-e745-4992-b987-fecff299760b")
    
    Task{
      await self.loadAllPosts()
    }
  }


  func savePost(){
    if let post = self.selectedPost {
      rootRef.child("Posts").child(String(self.numPosts)).setValue(
        [
          "address": post.address,
          "author": post.author.toAnyObject(),
          "food_photo": post.food_photo,
          "selfie_photo": post.selfie_photo,
          "review_restaurant": post.review_restaurant,
          "review_dish": post.review_dish,
          "review_comment": post.review_comment,
          "review_stars": post.review_stars,
          "reviewed": post.reviewed,
          "likes": post.likes
        ]
      )
    }
  }
  
  func updateUser() {
    let user = self.currentUser
    rootRef.child("Users").child(String(self.numUsers)).setValue(
      [
        "display_name": user.display_name,
        "username": user.display_name,
//        "profile_picture": "https://s3-media3.fl.yelpcdn.com/bphoto/hCp7TJqo1m_rGPkvso4dxw/o.jpg",
        "profile_picture_url": user.profile_picture,
        "followers": user.followers,
        "following": user.following,
        "saved_posts":[],
        "search_history": [],
        "recent_posts":[]
      ]
    )
  }
  
  func loadAllPosts() async {
    var snapshots: [DataSnapshot] = []
    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot{
          snapshots.append(snapshot)
        }
      }
    })
    for snapshot in snapshots {
      if let post = await Post(snapshot: snapshot) {
        self.postList.append(post)
        self.numPosts += 1
      }
    }
  }
  
  func loadUser() async {
    var snapshots: [DataSnapshot] = []
    rootRef.child("Users").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot {
          snapshots.append(snapshot)
        }
      }
    })
    for snapshot in snapshots {
      if let user = await User(snapshot: snapshot) {
        self.userList.append(user)
        self.numUsers += 1
      }
    }
  }
  
  func postsNeedReview() async -> [Post] {
    var res: [Post] = []
    var snapshots: [DataSnapshot] = []
    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot {
          snapshots.append(snapshot)
          }
        }
      })
    for snapshot in snapshots {
      if let post = await Post(snapshot: snapshot) {
        if await post.reviewed == false {
          res.append(post)
        }
      }
    }
    return res
  }
  
  
  
}

