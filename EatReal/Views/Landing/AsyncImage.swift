//
//  AsyncImage.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/17/22.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct AsyncImage: View {
    
    var imageType = "post"
    @ObservedObject var imageLoader: StoredImage
    @State var image: UIImage = UIImage()
    @State var url: URL = URL(fileURLWithPath: "image-placeholder")

  init(url: String, type: String = "post") {
    self.imageLoader = StoredImage(url: url)
    self.url = URL(string: url)!
    self.imageType = type
  }

    var body: some View {
      if (self.imageType == "profile"){
        Image(uiImage: image)
        .resizable()
        .frame(width: 30.0, height: 30.0)
        .onReceive(imageLoader.$image) { image in
            self.image = image
        }
        .onAppear {
          imageLoader.fetchImage()
        }
      } else if (self.imageType == "reaction"){
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 80,
                 height: 80)
          .foregroundColor(.primary)
          .background(Color.gray)
          .clipShape(Circle())
          .background(
            Circle()
              .stroke(Color.black, lineWidth: 2)
          ).onReceive(imageLoader.$image) { image in
            self.image = image
          }
          .onAppear {
            imageLoader.fetchImage()
          }
      } else if (self.imageType == "friendPreview"){
        Image(uiImage: image)
        .resizable()
        .frame(width: 50.0, height: 50.0)
        .onReceive(imageLoader.$image) { image in
            self.image = image
        }
        .onAppear {
          imageLoader.fetchImage()
        }
      } else if (self.imageType == "myProfile"){
        Image(uiImage: image)
        .resizable()
        .frame(width: 250.0, height: 250.0)
        .onReceive(imageLoader.$image) { image in
            self.image = image
        }
        .onAppear {
          imageLoader.fetchImage()
        }
      } else if (self.imageType == "need_review"){
        Image(uiImage: image)
          .resizable()
          .frame(width: 300, height: 300)
          .cornerRadius(10)
          .onReceive(imageLoader.$image) { image in
              self.image = image
          }
          .onAppear {
            imageLoader.fetchImage()
          }
      } else
      {
        Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .onReceive(imageLoader.$image) { image in
            self.image = image
        }
        .onAppear {
            imageLoader.fetchImage()
        }
      }
    }
}
