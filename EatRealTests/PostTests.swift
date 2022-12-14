//
//  PostTest.swift
//  EatReal
//
//  Created by Leanne Sun on 11/30/22.
//

import XCTest
import Firebase
@testable import EatReal

final class PostTests: XCTestCase {

    var placeholderImageURL = "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/profile%2Femily.JPG?alt=media&token=c2a7afd1-35eb-4584-b21f-187c4d6e8f95"
    let placeholderImage = UIImage(named: "image-placeholder.jpeg")!
  var selfieURL = "https://firebasestorage.googleapis.com/v0/b/eatreal-s22.appspot.com/o/reaction%2Fleanne_thumbsup.jpg?alt=media&token=637b101a-b760-4297-962c-e5af25ae2b9d"
  let selfieImage = UIImage(named: "image-placeholder.jpeg")!
  
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
      let user = PreviewUser(id: 2, display_name: "Emily Feng", profile_picture: placeholderImageURL)
      let examplePost = await Post(address: "123 Main St", author: user, food_photo: placeholderImage, review_restaurant: "hunan")
      XCTAssertTrue(examplePost.address == "123 Main St")
      XCTAssertTrue(examplePost.review_restaurant == "hunan")
      XCTAssertTrue(examplePost.author.display_name == "Emily Feng")
      XCTAssertTrue(examplePost.author.id == 2)
      XCTAssertTrue(examplePost.author.profile_picture == placeholderImageURL)
      XCTAssertTrue(examplePost.review_comment == "Your friend has not left any comments yet.")
      XCTAssertFalse(examplePost.reviewed)
      
      examplePost.addReview(selfie_photo: selfieImage, review_restaurant: "hunan express", review_dish: "chicken", review_comment: "good service", review_stars: 4.0)
      XCTAssertFalse(examplePost.review_restaurant == "hunan")
      XCTAssertTrue(examplePost.review_restaurant == "hunan express")
      XCTAssertTrue(examplePost.review_dish == "chicken")
      XCTAssertTrue(examplePost.review_comment == "good service")
      XCTAssertTrue(examplePost.review_stars == 4.0)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
