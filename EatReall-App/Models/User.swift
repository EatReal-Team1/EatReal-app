//
//  User.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/8/22.
//

import SwiftUI
import Alamofire
import Firebase
import Foundation

class User {
//  let id: UUID
  var display_name: String
  var username: String
  var profile_picture: String
  var followers: [PreviewUser]
  var following: [PreviewUser]
  //  let saved_posts: [Int] // simplified as int for now
  //  let search_history:
  //  let recent_posts: [Int]
  
  init(display_name: String, username: String, profile_picture: String) {
//    self.id = UUID()
    self.display_name = display_name
    self.username = username
    self.profile_picture = profile_picture
    self.followers = []
    self.following = []
  }
  
  init?(snapshot: DataSnapshot) {
    guard
      let value = snapshot.value as? NSDictionary,
//      let id = value["id"] as? UUID,
      let display_name = value["display_name"] as? String,
      let username = value["username"] as? String,
      let profile_picture = value["profile_picture"] as? String//,
//      let followers = value["followers"] as? [NSDictionary],
//      let following = value["following"] as? [NSDictionary]
    else {
      return nil
    }
//    self.id = id
    print(value["followers"])
    print(value["following"])
    self.display_name = display_name
    self.username = username
    self.profile_picture = profile_picture
    self.following = []
    self.followers = []
//    for follow in following {
//      let follow_user_display_name = follow["display_name"] as! String
//      let follow_user_profile_picture = follow["profile_picture"]  as! String
//      self.following.append(PreviewUser(display_name: follow_user_display_name, profile_picture: follow_user_profile_picture))
//    }
//    for follower in followers {
//      let follower_display_name = follower["display_name"] as! String
//      let follower_profile_picture = follower["profile_picture"]  as! String
//      self.followers.append(PreviewUser(display_name: follower_display_name, profile_picture: follower_profile_picture))
//    }
  }
  
  func sendFriendRequest(to_user: User) -> FriendRequest {
    // V1 doesn't need approval
    let self_preview = PreviewUser(display_name: self.display_name, profile_picture: self.profile_picture)
    let to_user_preview = PreviewUser(display_name: to_user.display_name, profile_picture: to_user.profile_picture)
    to_user.followers.append(self_preview)
    self.following.append(to_user_preview)
    return FriendRequest(by: self, to: to_user)
  }
  

}

struct PreviewUser {
//  let id: UUID
  let display_name: String
  let profile_picture: String
  
  init(display_name: String, profile_picture: String){
    self.display_name = display_name
    self.profile_picture = profile_picture
  }
}

