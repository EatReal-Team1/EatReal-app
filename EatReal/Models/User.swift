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

class User: Identifiable {
  let id: Int
  var display_name: String
  var username: String
  var profile_picture: StoredImage = StoredImage()
  var followers: [Int] = []
  var following: [Int] = []
  
  init(display_name: String, username: String, profile_picture: UIImage) {
    self.display_name = display_name
    self.username = username
    self.id = 0
    Task {
      let stored_profile_picture = await StoredImage(image: profile_picture, contentType: "profile")
      self.profile_picture = stored_profile_picture
    }
  }

  init?(snapshot: DataSnapshot) {
    guard
      let value = snapshot.value as? NSDictionary,
      let id = value["id"] as? Int,
      let display_name = value["display_name"] as? String,
      let username = value["username"] as? String,
      let profile_picture_url = value["profile_picture_url"] as? String
    else {
      return nil
    }
    self.following = value["following"] as? [Int] ?? []
    self.followers = value["followers"] as? [Int] ?? []
    self.id = id
    self.display_name = display_name
    self.username = username
    self.profile_picture = StoredImage(url: profile_picture_url)
  }

  func sendFriendRequest(to_user: User) {
    to_user.followers.append(self.id)
    self.following.append(to_user.id)
  }
  
  func toPreviewuser() -> PreviewUser {
    return PreviewUser(id: self.id, display_name: self.display_name, profile_picture: self.profile_picture.url)
  }

}

extension User: Equatable {
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username
  }
}

class PreviewUser: Decodable{
  let id: Int
  let display_name: String
  let profile_picture: String
  var followers: [String]
  var following: [String]

  init(id: Int, display_name: String, profile_picture: String){
    self.id = id
    self.display_name = display_name
    self.profile_picture = profile_picture
    self.followers = []
    self.following = []
  }
  
  func toAnyObject() -> Any {
       return [
        "id": id,
        "display_name": display_name,
        "profile_picture": profile_picture
       ]
   }
}

