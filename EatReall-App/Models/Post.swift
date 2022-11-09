//
//  Post.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/8/22.
//

import SwiftUI
import Alamofire
import Firebase
import FirebaseStorage
import Foundation

// Observable?
class Post {
  var address: String
  var author: PreviewUser
  var food_photo: String
  var selfie_photo: String
  var review_restaurant: String
  var review_dish: String
  var review_comment: String
  var review_stars: Double
  var reviewed: Bool
  var likes: Int
  
  init(address: String, author: PreviewUser, food_photo: String, review_restaurant: String, selfie_photo: String = "", review_dish: String = "", review_comment: String = "", review_stars: Double = 0.0, reviewed: Bool = false) {
    self.address = address
    self.author = author
    self.food_photo = food_photo
    self.review_restaurant = review_restaurant
    // Optional
    self.selfie_photo = selfie_photo
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = reviewed
    self.likes = 0
  }
  
  init?(snapshot: DataSnapshot) {
    guard
      let value = snapshot.value as? NSDictionary,
      let address = value["address"] as? String,
      let author = value["author"] as? NSDictionary,
      let food_photo = value["food_photo"] as? String,
      let selfie_photo = value["selfie_photo"] as? String,
      let review_restaurant = value["review_restaurant"] as? String,
      let review_dish = value["review_dish"] as? String,
      let review_comment = value["review_comment"] as? String,
      let review_stars = value["review_stars"] as? Double,
      let reviewed = value["reviewed"] as? Bool,
      let likes = value["likes"] as? Int
    else {
      return nil
    }
//    print(author["display_name"] as! String)
    
    self.address = address
    self.author = PreviewUser(display_name: author["display_name"] as! String,
                              profile_picture: author["profile_picture"] as! String)//author
    self.food_photo = food_photo
    self.selfie_photo = selfie_photo
    self.review_restaurant = review_restaurant
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = reviewed
    self.likes = likes
  }
  
  func addReview(selfie_photo: String, review_dish: String, review_comment: String, review_stars: Double) {
    
    self.selfie_photo = selfie_photo
    self.review_dish = review_dish
    self.review_comment = review_comment
    self.review_stars = review_stars
    self.reviewed = true
  }
  
  // placing it here for now. will be refactored later
  func uploadImage(imageType: String, image: UIImage) {
    let randomID = UUID.init().uuidString
    let uploadRef = Storage.storage().reference(withPath: "\(imageType)/\(randomID).jpg")
//    guard let imageData = imageView.image?.jpegData(compressionQuality: 0.75) else {return}
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
    let uploadMetadata = StorageMetadata.init()
    uploadMetadata.contentType = "image/jpeg"
    
    uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
      if let error = error {
        print("Unable to upload image \(error.localizedDescription)")
        return
      }
      print("Put is complete and got back: \(String(describing: downloadMetadata))")
    }
  }
}

