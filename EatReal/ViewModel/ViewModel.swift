//
//  CameraViewController.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI
import Firebase

class ViewModel: ObservableObject {
  private var rootRef: DatabaseReference = Database.database().reference()
  @Published var image: UIImage?
  @Published var showPicker = false
  @Published var selectedPost: Post?
  @Published var reviewingPost: Post?
  
  @Published var postList: [Post] = []
  @Published var filteredPostList: [Post]
  @Published var numPosts: Int
  @Published var userList: [User]
  @Published var numUsers: Int
  @Published var currentUser: User
  
  init() {
    self.postList = []
    self.filteredPostList = []
    self.numPosts = 0
    self.userList = []
    self.numUsers = 1
    self.currentUser = User(display_name: "Leanne Sun", username: "leannesxh14", profile_picture: UIImage(named: "image-placeholder")!)
    self.loadUser()
    self.loadAllPosts()
  }


  func savePost(){
    if let post = self.selectedPost {
      rootRef.child("Posts").child(String(self.numPosts)).setValue(
        [
          "id": self.numPosts,
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
  
  func updatePost(){
    if let post = self.selectedPost {
      rootRef.child("Posts").child(String(post.id)).updateChildValues(
        [
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
        "profile_picture": user.profile_picture,
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
          // Setting currentUser to the first user in db
          if self.userList == [] {
            self.currentUser = user
          }
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
  
  func search(searchText: String) -> [Post]{
    self.filteredPostList = postList.filter { post in
      return post.review_restaurant.lowercased().contains(searchText.lowercased())
    }
    return self.filteredPostList
  }
  
  func searchUsers(searchText: String) -> [User]{
    print("all users: ", userList.count)
    return self.userList.filter{ user in
      return user.username.lowercased().contains(searchText.lowercased())
    }
  }
  
}

