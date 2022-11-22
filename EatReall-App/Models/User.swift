//
//  User.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/9/22.
//

import SwiftUI
import Alamofire
import Firebase
import Foundation

class User {
//  let id: UUID
  var display_name: String
  var username: String
  var profile_picture: StoredImage
  var profile_picture_url: String
  var followers: [PreviewUser]
  var following: [PreviewUser]
  //  let saved_posts: [Int] // simplified as int for now
  //  let search_history:
  //  let recent_posts: [Int]
  
  init(display_name: String, username: String, profile_picture: UIImage) async {
    self.display_name = display_name
    self.username = username
    self.followers = []
    self.following = []
    self.profile_picture = await StoredImage(image: profile_picture, contentType: "profile")
    self.profile_picture_url = ""
    await self.profile_picture.fetchImage()
    self.profile_picture_url = self.profile_picture.url
  }

  init?(snapshot: DataSnapshot) async {
    guard
      let value = snapshot.value as? NSDictionary,
      let display_name = value["display_name"] as? String,
      let username = value["username"] as? String,
      let profile_picture_url = value["profile_picture_url"] as? String
    else {
      return nil
    }
    if let followers = value["followers"] as? [PreviewUser]{
      self.followers = followers
    } else {
      self.followers = []
    }
    if let following = value["following"] as? [PreviewUser] {
      self.following = following
    }else {
      self.following = []
    }
    self.display_name = display_name
    self.username = username
    self.profile_picture_url = profile_picture_url
    self.profile_picture = await StoredImage(url: profile_picture_url)
    
  }

  func sendFriendRequest(to_user: User) -> FriendRequest {
    // V1 doesn't need approval
    let self_preview = PreviewUser(display_name: self.display_name, profile_picture: self.profile_picture.path)
    let to_user_preview = PreviewUser(display_name: to_user.display_name, profile_picture: to_user.profile_picture.path)
    to_user.followers.append(self_preview)
    self.following.append(to_user_preview)
    return FriendRequest(by: self, to: to_user)
  }

}

extension User: Equatable {
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username
  }
}

class PreviewUser{
//  let id: UUID
  let display_name: String
  let profile_picture: String
  var followers: [String]
  var following: [String]

  init(display_name: String, profile_picture: String){
    self.display_name = display_name
    self.profile_picture = profile_picture
    self.followers = []
    self.following = []
  }
  
  func sendFriendRequest(to_user: String) {
      // V1 doesn't need approval
    self.following.append(to_user)
  }
  
  func toAnyObject() -> Any {
         return [
             "display_name": display_name,
             "profile_picture": profile_picture
         ]
   }
}

