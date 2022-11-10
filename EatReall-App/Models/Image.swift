//
//  Image.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/9/22.
//

import SwiftUI
import Alamofire
import Firebase
import FirebaseStorage
import Foundation

class StoredImage {
  var path: String
  var image: UIImage?
  
  init(path: String) {
    self.path = path
    fetchImage(path: path)
  }
  
  init(image: UIImage, contentType: String){
    self.image = image
    let randomID = UUID.init().uuidString
    self.path = "\(contentType)/\(randomID).jpg"
    uploadImage(path: path, image: image)
    
  }
  
  // placing it here for now. will be refactored later
  func uploadImage(path: String, image: UIImage) {
    
    let uploadRef = Storage.storage().reference(withPath: "\(path).jpg")
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      self.image = UIImage(named: "example/image-placeholder.jpeg")
      return
    }
    let uploadMetadata = StorageMetadata.init()
    uploadMetadata.contentType = "image/jpeg"

    uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
      if let error = error {
        print("Unable to upload image \(error.localizedDescription)")
        self.image = UIImage(named: "example/image-placeholder.jpeg")
        return
      }
      print("Put is complete and got back: \(String(describing: downloadMetadata))")
    }
  }
  
  func fetchImage(path: String){
    let storageRef = Storage.storage().reference(withPath: path)
    storageRef.getData(maxSize: 4*1024*1024) { (data, error) in
      if let error = error {
        print("Got and error fetching data: \(error.localizedDescription)")
        return
      }
      if let data = data {
        self.image = UIImage(data: data)
      }
    }
  }
}
