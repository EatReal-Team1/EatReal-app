//
//  ImagePicker.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/8/22.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  
  @Binding var isShown: Bool
  @Binding var image: UIImage?
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    
  }
  
  func makeCoordinator() -> ImagePickerCordinator {
    return ImagePickerCordinator(isShown: $isShown, image: $image)
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
}
