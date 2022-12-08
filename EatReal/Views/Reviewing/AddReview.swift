//
//  AddReview.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

struct AddReview: View {
  @State private var selectedImage: UIImage?
  @State private var isImagePickerDisplay = false
  @State private var showReviewForm = false
  
    var body: some View {
      if let selfie = selectedImage {
        FormView(selfie_photo: selfie)
      } else {
        VStack{
            //header
          ZStack {
            Color.black
              .ignoresSafeArea()
            
            Text("React with a selfie")
              .padding(.horizontal, 50)
              .font(.system(
                size: 30,
                weight: .semibold,
                design: .default))
              .foregroundColor(.white)
          }.frame(height: 100.0)
          
          
            //content view
          SelfieCameraView(selectedImage: $selectedImage, showReviewForm: $showReviewForm).ignoresSafeArea()

          
          Spacer()
          
        }

      }
    }
}

//struct AddReview_Previews: PreviewProvider {
//    static var previews: some View {
//        AddReview()
//    }
//}
