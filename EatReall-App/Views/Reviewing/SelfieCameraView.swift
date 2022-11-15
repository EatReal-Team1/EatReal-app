//
//  SelfieCameraView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/15/22.
//

  //
  //  EmbeddedCameraView.swift
  //  EatReal-v1
  //
  //  Created by Emily Feng on 11/10/22.
  //

import SwiftUI

struct SelfieCameraView: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIImagePickerController
  @Binding var selectedImage: UIImage?
  @Binding var showReviewForm: Bool
  @ObservedObject var viewModel: ViewModel = ViewModel()
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    viewController.delegate = context.coordinator
    viewController.sourceType = .camera
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  func makeCoordinator() -> SelfieCameraView.Coordinator {
    return Coordinator(self)
  }
}

extension SelfieCameraView {
  class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: SelfieCameraView
    
    init(_ parent: SelfieCameraView) {
      self.parent = parent
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.parent.selectedImage = image
        self.parent.showReviewForm = true
      }
    }
  }
}
