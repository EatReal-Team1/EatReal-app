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
  @Published var myPostList: [Post] = []
    
  @Published var filteredPostList: [Post]
  @Published var numPosts: Int
  @Published var userList: [User]
  @Published var numUsers: Int
  @Published var currentUser: User
  
  init() {
    self.postList = []
      self.myPostList = []
    self.filteredPostList = []
    self.numPosts = 0
    self.userList = []
    self.numUsers = 1
    self.currentUser = User(display_name: "Leanne Sun", username: "leannesxh14", profile_picture: UIImage(named: "image-placeholder")!)
    self.loadUser()
    self.loadAllPosts()
    self.myPosts()
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
    self.numPosts += 1
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
    
    
    func saveUser(name: String, username: String) {
      let user = self.currentUser
      rootRef.child("Users").child(String(self.numUsers+1)).setValue(
        [
          "display_name": name,
          "username": username,
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
    
  
  func updateUser(id: Int) {
    let curUser = self.userList[id]
    rootRef.child("Users").child(String(id)).setValue(
      [
        "id": curUser.id,
        "display_name": curUser.display_name,
        "username": curUser.username,
        "profile_picture_url": curUser.profile_picture.url,
        "followers": curUser.followers,
        "following": curUser.following,
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
  
  func myPosts() -> [Post] {
    //var res: [Post] = []
    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
           let post = Post(snapshot: snapshot) {
            print(post.author.display_name == self.currentUser.display_name)
                // print(self.currentUser.display_name )
            
            if post.author.display_name == self.currentUser.display_name {
               // print("1")
                self.myPostList.append(post)
          }
        }
      }
    })
      //print(res)
    return self.myPostList
      
  }
    
    func setCurrentUser(username: String) {
      //var res: [Post] = []
      rootRef.child("Users").observe(.value, with: { snapshot in
        for child in snapshot.children {
          if let snapshot = child as? DataSnapshot,
             let user = User(snapshot: snapshot) {
              //print(post.author.display_name == self.currentUser.display_name)
                  // print(self.currentUser.display_name )
              
              if user.username == username {
                 // print("1")
                  self.currentUser = user
                  //print(self.currentUser)
            }
          }
        }
      })
        //print(res)
     // return self.myPostList
        
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
    return self.userList.filter{ user in
      return user.username.lowercased().contains(searchText.lowercased())
    }
  }
  
}

