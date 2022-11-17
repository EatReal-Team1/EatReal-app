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
  var url: String
  
  init(url: String) {
    self.path = ""
    self.url = url
    fetchImage()
  }
  
  init(image: UIImage, contentType: String){
    if contentType == "placeholder" {
      self.image = image
      self.path = ""
      self.url = ""
    }
    else {
      self.image = image
      let randomID = UUID.init().uuidString
      self.path = "\(contentType)/\(randomID)"
      self.url = ""
      uploadImage(path: self.path, image: image)
    }
  }

  func uploadImage(path: String, image: UIImage) {
    print("path: \(path)")
    let uploadRef = Storage.storage().reference(withPath: "\(path)")
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      self.image = UIImage(named: "image-placeholder.jpeg")
      return
    }
//    let uploadMetadata = StorageMetadata.init()
//    uploadMetadata.contentType = "image/heic"

    uploadRef.putData(imageData, metadata: nil, completion: { _, error in
      guard error == nil else {
        print("Failed to upload")
        return
      }
      uploadRef.downloadURL { url, error in
        guard let url = url, error == nil else {
          return
        }
        self.url = url.absoluteString
      }
    })
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
  func fetchImage(){
    guard let url = URL(string: self.url) else {
      print("failed to convert url: \(self.url)")
      return
    }

    print("url: \(self.url)")
    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
      guard let data = data, error == nil else {
        print("Failed to access image url: \(String(describing: error))")
        return
      }
      DispatchQueue.main.async {
        self.image = UIImage(data: data)
//        self.image = UIImage(named: "placeholder-post")
        
      }
    })

    task.resume()
    
    //    let storageRef = Storage.storage().reference(withPath: self.path)
    //    storageRef.getData(maxSize: 4*1024*1024) { (data, error) in
    //      if let error = error {
    //        print("Got and error fetching data: \(error.localizedDescription)")
    //        return
    //      }
    //      if let data = data {
    //        print("fetching image: \(self.path)")
    ////        self.image = UIImage(data: data)
    //        completionHandler(UIImage(data: data)!)
    //      }
    //    }
  }
}
