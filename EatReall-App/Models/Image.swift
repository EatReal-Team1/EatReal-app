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

class StoredImage: ObservableObject {
  var path: String
  @Published var image = UIImage()
  @Published var url: String
  
  init(url: String) async{
    self.path = ""
    self.url = url
    if url != "" {
      await fetchImage()
    }
  }
  
  init(image: UIImage, contentType: String) async {
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
      await uploadImage(path: self.path, image: image)
    }
  }

  func uploadImage(path: String, image: UIImage) async{
    print("path: \(path)")
    let uploadRef = Storage.storage().reference(withPath: "\(path)")
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      self.image = UIImage(named: "image-placeholder.jpeg")!
      return
    }
//    let uploadMetadata = StorageMetadata.init()
//    uploadMetadata.contentType = "image/heic"

    let task = uploadRef.putData(imageData, metadata: nil, completion: { _, error in
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
    task.resume()
  }
  
  func fetchImage() async{
    guard let url = URL(string: self.url) else {
      if (url == "") {return}
      print("failed to convert url: \(self.url)")
      return
    }

//    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
//      guard let data = data, error == nil else {
//        print("Failed to access image url: \(String(describing: error))")
//        return
//      }
//      DispatchQueue.main.async {
//
//        self.image = UIImage(data: data) ?? UIImage(named: "image-placeholder")!
//
//      }
//    })
//    task.resume()
    URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
    guard let data = data, error == nil else {
      print("Failed to access image url: \(String(describing: error))")
      return
    }
      DispatchQueue.main.async {
        print("hi")
        self.image = UIImage(data: data)!
      }
    })
  }
}
