//
//  Post.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/9/22.
//

import SwiftUI
import Alamofire
import Firebase
import FirebaseStorage
import Foundation

let placeholder = UIImage(named: "image-placeholder.jpeg")!
// let stored_placeholder = StoredImage(url: "example/image-placeholder.jpeg")

// Observable?
class Post: Identifiable {
//  var id: UUID
  var address: String
  var author: PreviewUser
  @ObservedObject var foodImageLoader: StoredImage// = StoredImage(url: "")
  
  @State var food_photo: String
  @ObservedObject var selfieImageLoader: StoredImage// = StoredImage(url: "")
  @State var selfie_photo: String
  var review_restaurant: String
  var review_dish: String
  var review_comment: String
  var review_stars: Double
  var reviewed: Bool
  var likes: Int
//  let rootRef = Database.database().reference()

  /// UPLOAD
  init(address: String, author: PreviewUser, food_photo: UIImage, review_restaurant: String, selfie_photo: UIImage = placeholder, review_dish: String = "", review_comment: String = "Your friend has not left any comments yet.", review_stars: Double = 0.0, reviewed: Bool = false) async {
//    self.id = UUID()
    self.address = address
    self.author = author
    self.foodImageLoader = await StoredImage(image: food_photo, contentType: "post")
    self.food_photo = ""
    self.review_restaurant = review_restaurant
    // Optional
    self.selfieImageLoader = await StoredImage(image: selfie_photo, contentType: "reaction")
    self.selfie_photo = ""
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = reviewed
    self.likes = 0
    // Load images from image loaders
    await foodImageLoader.uploadImage(path: "post/", image: food_photo)
    self.food_photo = foodImageLoader.url
    await selfieImageLoader.fetchImage()
    self.selfie_photo = selfieImageLoader.url
  }

  init?(snapshot: DataSnapshot) async {
    guard
      let value = snapshot.value as? NSDictionary,
//      let id = value["id"] as? UUID,
      let address = value["address"] as? String,
      let author = value["author"] as? NSDictionary,
      let food_photo_url = value["food_photo_url"] as? String,
//      let food_foto_path = value["food_photo"] as? String,
      let selfie_photo_url = value["selfie_photo"] as? String,
      let review_restaurant = value["review_restaurant"] as? String,
      let review_dish = value["review_dish"] as? String,
      let review_comment = value["review_comment"] as? String,
      let review_stars = value["review_stars"] as? Double,
      let reviewed = value["reviewed"] as? Bool,
      let likes = value["likes"] as? Int
    else {
      return nil
    }
//    self.id = id
    self.address = address
    self.author = PreviewUser(display_name: author["display_name"] as! String,
                              profile_picture: author["profile_picture"] as! String)

    self.food_photo = food_photo_url
    self.selfie_photo = selfie_photo_url
    self.review_restaurant = review_restaurant
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = reviewed
    self.likes = likes
    self.foodImageLoader = await StoredImage(url: "")
    self.selfieImageLoader = await StoredImage(url: "")
  }

  func addReview(selfie_photo: UIImage, review_restaurant: String, review_dish: String, review_comment: String, review_stars: Double) async {
    let stored_selfie_photo = await StoredImage(image: selfie_photo, contentType: "reaction")
    await stored_selfie_photo.fetchImage()
    self.selfie_photo = stored_selfie_photo.url
    self.review_restaurant = review_restaurant
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = true
//    self.rootRef.child("Posts").child(self.id).setValue(["selfie_photo": stored_selfie_photo.path])
  }
  
}

class PostList {
  @Published var items: [Post]
  
  init(items: [Post]) {
    self.items = items
  }
}
