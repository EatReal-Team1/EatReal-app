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
    self.rootRef = FirebaseDatabase.Database.database().reference()
    self.postList = []
    self.numPosts = 0
    self.userList = []
    self.numUsers = 1
    self.currentUser = PreviewUser(display_name: "fake user", profile_picture: "placeholder-profile-img")
    
    self.loadAllPosts()
  }


  func savePost(){
    if let post = self.selectedPost {
      rootRef.child("Posts").child(String(self.numPosts)).setValue(
        [
          "address": post.address,
          "author_id": "0",
          "food_photo": "https://s3-media3.fl.yelpcdn.com/bphoto/hCp7TJqo1m_rGPkvso4dxw/o.jpg",
          "selfie_photo": "https://s3-media3.fl.yelpcdn.com/bphoto/hCp7TJqo1m_rGPkvso4dxw/o.jpg",
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
        "profile_picture": "https://s3-media3.fl.yelpcdn.com/bphoto/hCp7TJqo1m_rGPkvso4dxw/o.jpg",
        "followers": user.followers,
        "following": user.following,
        "saved_posts":[],
        "search_history": [],
        "recent_posts":[]
      ]
    )
  }
  
  func loadAllPosts() {
    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
           let post = Post(snapshot: snapshot) {
          self.postList.append(post)
          self.numPosts += 1
        }
      }
    })
  }
  
  func loadUser() {
    rootRef.child("Users").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
           let user = User(snapshot: snapshot) {
          self.userList.append(user)
          self.numUsers += 1
        }
      }
    })
  }
  
  func postsNeedReview() -> [Post] {
    var res: [Post] = []
    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
           let post = Post(snapshot: snapshot) {
          if post.reviewed == false {
            res.append(post)
          }
        }
      }
    })
    return res
  }
  
  
  
}

