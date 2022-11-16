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
    fetchImage(path: path) { (result) in
      self.image = result
    }
  }
  
  init(image: UIImage, contentType: String){
    self.image = image
    let randomID = UUID.init().uuidString
//    self.path = "\(contentType)/\(randomID).jpg"
    self.path = "\(contentType)/\(randomID)"
    uploadImage(path: self.path, image: image)
    
  }

  func uploadImage(path: String, image: UIImage) {
    print("path: \(path)")
    let uploadRef = Storage.storage().reference(withPath: "\(path)")
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      self.image = UIImage(named: "image-placeholder.jpeg")
      return
    }
    let uploadMetadata = StorageMetadata.init()
    uploadMetadata.contentType = "image/heic"

    uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
      if let error = error {
        print("Unable to upload image \(error.localizedDescription)")
        self.image = UIImage(named: "example/image-placeholder.jpeg")
        return
      }
      print("Put is complete and got back: \(String(describing: downloadMetadata))")
    }
  }
  
//  func fetchImage(path: String){
//    let storageRef = Storage.storage().reference(withPath: self.path)
////    let storageRef = Storage.storage().child(path)
//    storageRef.getData(maxSize: 4*1024*1024) { (data, error) in
//      if let error = error {
//        print("Got and error fetching data: \(error.localizedDescription)")
//        return
//      }
//      if let data = data {
//        print("fetching image: \(self.path)")
//        self.image = UIImage(data: data)
//      }
//    }
//  }
  func fetchImage(path: String, completionHandler: @escaping (UIImage) -> Void){
    let storageRef = Storage.storage().reference(withPath: self.path)
    storageRef.getData(maxSize: 1*1024*1024) { (data, error) in
      if let error = error {
        print("Got and error fetching data: \(error.localizedDescription)")
        return
      }
      if let data = data {
        print("fetching image: \(self.path)")
//        self.image = UIImage(data: data)
        completionHandler(UIImage(data: data)!)
      }
    }
  }
}
