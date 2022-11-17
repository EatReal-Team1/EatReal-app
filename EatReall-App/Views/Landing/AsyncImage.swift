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
    var url: URL
//    private let placeholder: () -> Placeholder
//    private let image: (Image) -> ConfiguredImage

    @ObservedObject var imageLoader: StoredImage
//    @State var imageData: UIImage?
    @State var image: UIImage = UIImage()

//    init(
//        url: String,
//        @ViewBuilder placeholder: @escaping () -> Placeholder,
//        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
//    ) {
//        self.url = URL(string: url)!
//        self.placeholder = placeholder
//        self.image = image
//        self.imageLoader = StoredImage(url: url)
//    }
//
//    @ViewBuilder private var imageContent: some View {
//        if let data = imageData {
//            image(Image(uiImage: data))
//        } else {
//            placeholder()
//        }
//    }
  
  init(url: String) {
    self.url = URL(string: url)!
    self.imageLoader = StoredImage(url: url)
  }

    var body: some View {
//        imageContent
//            .onReceive(imageLoader.$image) { imageData in
//                self.imageData = imageData
//            }
      Image(uiImage: image)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(
                    width: 370,
                    height: 450)
                  .onReceive(imageLoader.$image) { image in
                      self.image = image
                  }
                  .onAppear {
                      imageLoader.fetchImage()
                  }
    }
}
