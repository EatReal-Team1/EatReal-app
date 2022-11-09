//
//  CameraView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/8/22.
//

import SwiftUI

struct CameraView: View {
  @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
  @State private var selectedImage: UIImage?
  @State private var isImagePickerDisplay = false
  var body: some View {
    NavigationView{
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
        
        Spacer()
        
          //content view
        VStack {
          
          if selectedImage != nil {
            Image(uiImage: selectedImage!)
              .resizable()
              .frame(width: 300, height: 300)
          }
            //          else {
            //            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            //          }
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
          ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
        Spacer()
        
          //footer navigation
        ZStack {
          Color.black
            .ignoresSafeArea()
          
          if selectedImage != nil {
            HStack(alignment: .bottom){
              
              Button(action: {
                self.sourceType = .photoLibrary
                selectedImage = nil
              }) {
                Text("Retake")
                  .padding(.horizontal, 30)
                  .font(.system(
                    size: 35,
                    weight: .bold,
                    design: .default))
                  .foregroundColor(.white)
              }
              
              Spacer()
              
              
              NavigationLink(destination: LandingView()) {
                Text("Post")
                  .padding(.horizontal, 30)
                  .font(.system(
                    size: 35,
                    weight: .bold,
                    design: .default))
                  .foregroundColor(.white)
              }
            }
            
            
          } else {
            
            HStack(alignment: .bottom){
              
                //            Button(action: {
                //              self.sourceType = .camera
                //              selectedImage = nil
                //            }) {
                //              Text("X")
                //                .padding(.horizontal, 30)
                //                .font(.system(
                //                  size: 35,
                //                  weight: .bold,
                //                  design: .default))
                //                .foregroundColor(.white)
                //            }
                //
                //            Spacer()
              
              Button(action: {
                self.sourceType = .camera
                self.isImagePickerDisplay.toggle()
              }) {
                Text("Camera")
                  .padding(.horizontal, 30)
                  .font(.system(
                    size: 35,
                    weight: .bold,
                    design: .default))
                  .foregroundColor(.white)
              }
              
              Spacer()
              
              Button(action: {
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay = true
              }) {
                Image("upload")
                  .resizable()
                  .frame(width: 40.0, height: 40.0)
                  .foregroundColor(.white)
                  .padding(.horizontal, 30)
              }
            }
            
          }
        }.frame(height: 100.0)
      }
    }
  }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
