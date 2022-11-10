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
      NavigationView{
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
          VStack {
            if let img = selectedImage {
              Image(uiImage: img)
                .resizable()
                .frame(width: 300, height: 300)
            }
          }
          .frame(height: 550.0)
          .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)
          }
          
          Spacer()
          
          //footer navigation
          ZStack {
            Color.black
              .ignoresSafeArea()
            HStack(alignment: .bottom){
              
              Button(action: {
                self.isImagePickerDisplay = false
              }) {
                Text("X")
                  .padding(.horizontal, 30)
                  .font(.system(
                    size: 35,
                    weight: .bold,
                    design: .default))
                  .foregroundColor(.white)
              }
              
              Spacer()
              
              Button(action: {
                showReviewForm = true
              })  {
                Text("Camera")
                  .padding(.horizontal, 30)
                  .font(.system(
                    size: 35,
                    weight: .bold,
                    design: .default))
                  .foregroundColor(.white)
              }
              
              NavigationLink("", destination:  FormView(), isActive: $showReviewForm).navigationBarBackButtonHidden(true)
              
              Spacer()
            }
          }
        }
      }
    }
}

struct AddReview_Previews: PreviewProvider {
    static var previews: some View {
        AddReview()
    }
}
