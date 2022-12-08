//
//  UserTests.swift
//  EatRealTests
//
//  Created by Leanne Sun on 12/6/22.
//

import XCTest
import Firebase
@testable import EatReal

final class UserTests: XCTestCase {

    var placeholderImageURL = "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/profile%2Femily.JPG?alt=media&token=c2a7afd1-35eb-4584-b21f-187c4d6e8f95"
    let placeholderImage = UIImage(named: "image-placeholder.jpeg")!
  var selfieURL = "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/reaction%2Fleanne_thumbsup.jpg?alt=media&token=637b101a-b760-4297-962c-e5af25ae2b9d"
  let selfieImage = UIImage(named: "image-placeholder.jpeg")!

    func testExample() async throws {
      let user1 = User(display_name: "Xiaohan Sun", username: "xs", profile_picture: placeholderImage)
      var user2 = User(display_name: "Ze Rong", username: "zer", profile_picture: placeholderImage)
      XCTAssertTrue(user1.display_name == "Xiaohan Sun")
      XCTAssertTrue(user1.username == "xs")
      XCTAssertTrue(user2.display_name == "Ze Rong")
      XCTAssertTrue(user2.username == "zer")
      // Test image
//      XCTAssertTrue(user1.profile_picture.url == placeholderImage)
      
      // Test sendFriendRequest
      user1.sendFriendRequest(to_user: user2)
      XCTAssertTrue(user1.following[0] == user2.id)
      XCTAssertTrue(user2.followers[0] == user1.id)
    }

}
