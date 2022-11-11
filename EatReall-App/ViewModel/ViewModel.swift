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
  
  @Published var postList: [Post]
  @Published var numPosts: Int
  
//  var rootRef: DatabaseReference! = Database.database().reference()
  
  init() {
    self.rootRef = FirebaseDatabase.Database.database().reference()
    self.postList = []
    self.numPosts = 0
    
    loadAllPosts()
  }


  func savePost(){
    if let post = self.selectedPost {
      rootRef.child("posts").updateChildValues(
        [
          "address": post.address,
          "author_id": post.author,
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
  
  
  
}

