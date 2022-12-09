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
  }


  func savePost(){
    if let post = self.selectedPost {
      rootRef.child("Posts").child(String(self.numPosts)).setValue(
        [
          "id": self.numPosts,
          "address": post.address,
          "author": post.author.toAnyObject(),
          "food_photo_url": post.food_photo,
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
      rootRef.child("Users").child(String(self.numUsers)).setValue(
        [
          "display_name": name,
          "username": username,
          "profile_picture": user.profile_picture,
          "followers": user.followers,
          "following": user.following,
          "saved_posts":[],
          "search_history": [],
          "recent_posts":[]
        ]
      )
      self.numUsers += 1
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
        "saved_posts":curUser.savedPosts,
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
  
  func getSavedPosts() -> [Post] {
    var savedPosts: [Post] = []
    for post_id in currentUser.savedPosts {
      savedPosts.append(postList[post_id])
    }
//    print(savedPosts)
    return savedPosts
    
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

  func getMyPost() -> [Post] {
    var res: [Post] = []
    for post in postList{
      if post.author.id == currentUser.id {
        res.append(post)
      }
    }
    return res
  }
    
    func setCurrentUser(username_ipt: String) {
      //var res: [Post] = []
      rootRef.child("Users").observe(.value, with: { snapshot in
        for child in snapshot.children {
          if let snapshot = child as? DataSnapshot,
             let user = User(snapshot: snapshot) {
              //print(post.author.display_name == self.currentUser.display_name)
                  // print(self.currentUser.display_name )
              
              if user.username.lowercased() == username_ipt.lowercased() {
                  print("1")
                  self.currentUser = user
                  //print(self.currentUser)
            }
          }
        }
      })
//        myPostList = []
//        myPostList = myPosts()
        //print(res)
     // return self.myPostList
        
    }
  
  func sendFriendRequest(from: Int, to: Int) {
    if !userList[from].following.contains(to) {
      userList[from].following.append(to)
      userList[to].followers.append(from)
    }
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
  
  func getNeedReviewPosts() -> [Post] {
    var res: [Post] = []
    for post in self.postList {
      if !post.reviewed && post.author.id == currentUser.id{
        res.append(post)
        print(post.id)
      }
    }
    return res
  }
    
    func isSaved(postID: Int) -> Bool {
        return self.currentUser.savedPosts.contains(postID)
    }
    
    func postsaved(postID: Int) {
        // let curUser = self.userList[id]
        self.currentUser.savedPosts.append(postID)
         //   "search_history": [],
            //   "recent_posts":[]
          
        
        
    }
}

