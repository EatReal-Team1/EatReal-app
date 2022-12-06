//
//  EmbeddedCameraView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

struct EmbeddedCameraView: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIImagePickerController
  @Binding var selectedImage: UIImage?
  @ObservedObject var viewModel: ViewModel = ViewModel()
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    viewController.delegate = context.coordinator
    viewController.sourceType = .camera
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  func makeCoordinator() -> EmbeddedCameraView.Coordinator {
    return Coordinator(self)
  }
}

extension EmbeddedCameraView {
  class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: EmbeddedCameraView
    
    init(_ parent: EmbeddedCameraView) {
      self.parent = parent
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      
    }

    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) async {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.parent.selectedImage = image
        
        await self.parent.viewModel.selectedPost = Post(address: " ", author: self.parent.viewModel.currentUser.toPreviewuser(), food_photo: image, review_restaurant: " ")
        self.parent.viewModel.numPosts += 1
        self.parent.viewModel.savePost()
      }
    }
  }
}
