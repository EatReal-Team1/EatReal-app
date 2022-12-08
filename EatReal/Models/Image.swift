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
  var path: String = ""
  @Published var image = UIImage()
  @Published var url: String = ""
  
  init(){
  }
  
  init(url: String) {
    self.path = ""
    self.url = url
    fetchImage()
  }
  
  init(image: UIImage, contentType: String) async{
    self.image = image
    let randomID = UUID.init().uuidString
    self.path = "\(contentType)/\(randomID)"
    self.url = ""
    await uploadImage(path: self.path, image: image)
  }

  func uploadImage(path: String, image: UIImage) async {
    let uploadRef = Storage.storage().reference(withPath: "\(path)")
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      self.image = UIImage(named: "image-placeholder.jpeg")!
      return
    }
    let uploadMetadata = StorageMetadata.init()
    uploadMetadata.contentType = "image/heic"
    do {
      let _ = try await uploadRef.putDataAsync(imageData, metadata: uploadMetadata)
    } catch{
      print("Unable to upload image to storage.")
    }
    do {
      self.url = try await uploadRef.downloadURL().absoluteString
    } catch {
      print("Unable to save url.")
    }
  }
  
  func fetchImage(){
    guard let url = URL(string: self.url) else {
      print("failed to convert url: \(self.url)")
      return
    }

    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
      guard let data = data, error == nil else {
        print("Failed to access image url: \(String(describing: error))")
        return
      }
      DispatchQueue.main.async {
        self.image = UIImage(data: data)!
      }
    })

    task.resume()
  }
}
