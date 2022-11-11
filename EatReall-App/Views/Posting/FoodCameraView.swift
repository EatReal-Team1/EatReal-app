  //
  //  CameraView.swift
  //  EatReal-v1
  //
  //  Created by Emily Feng on 11/8/22.
  //

import SwiftUI

struct FoodCameraView: View {
  @State private var selectedImage: UIImage?
  var body: some View {
    if (selectedImage != nil) {
      LandingView()
    } else {
      VStack{
          //header
        ZStack {
          Color.black
            .ignoresSafeArea()
          
          Text("What are you eating?")
            .padding(.horizontal, 50)
            .font(.system(
              size: 30,
              weight: .semibold,
              design: .default))
            .foregroundColor(.white)
                    
        }.frame(height: 100.0)
        
        EmbeddedCameraView(selectedImage: $selectedImage).ignoresSafeArea()
      }
    }
  }
}

struct FoodCameraView_Previews: PreviewProvider {
  static var previews: some View {
    FoodCameraView()
  }
}
