//
//  FriendRequest.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/9/22.
//

import Foundation

struct FriendRequest {
  var request_by: User
  var request_to: User

  init(by: User, to: User) {
    request_by = by
    request_to = to
  }

}
