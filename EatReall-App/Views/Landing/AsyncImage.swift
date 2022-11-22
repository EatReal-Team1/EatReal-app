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
//    @ObservedObject var imageLoader: StoredImage
    @State var image: UIImage = UIImage()
    @State var url: URL = URL(fileURLWithPath: "image-placeholder")

  init(url: String, type: String = "post") async {
//    self.imageLoader = await StoredImage(url: url)
    self.url = URL(string: url) ?? URL(fileURLWithPath: "image-placeholder")
    self.imageType = type
  }

    var body: some View {
      if (self.imageType == "profile"){
        Image(uiImage: image)
        .resizable()
        .frame(width: 30.0, height: 30.0)
//        .onReceive(imageLoader.$image) { image in
//            self.image = image
//        }
//        .onAppear {
//          Task{
//            await imageLoader.fetchImage()
//          }
//        }
      }
      else if (self.imageType == "reaction"){
        Image(uiImage: image)
              .resizable()
              .frame(width: 101,
                     height: 101)
              .foregroundColor(.primary)
              .padding(8)
              .background(Color.gray)
              .clipShape(Circle())
              .background(
                Circle()
                  .stroke(Color.black, lineWidth: 2))
//              .onReceive(imageLoader.$image) { image in
//                  self.image = image
//              }
//              .onAppear {
//                Task{
//                  await imageLoader.fetchImage()
//                }
//              }
      }
        else
      {
        Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(
          width: 370,
          height: 450)
//        .onReceive(imageLoader.$image) { image in
//            self.image = image
//        }
//        .onAppear {
//          Task{
//            await imageLoader.fetchImage()
//          }
//        }
      }
    }
}
