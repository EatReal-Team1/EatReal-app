//
//  UploadProfilePicture.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/10/22.
//

import SwiftUI

struct UploadProfilePicture: View {
    //    @State var showImagePicker: Bool = false
    //    @State var image: UIImage? = nil
    //
    //    var displayImage: Image? {
    //      if let picture = image {
    //        return Image(uiImage: picture)
    //      } else {
    //        return nil
    //      }
    //    }
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        VStack {
            Text("Profile Picture").font(Font.custom("Helvetica Neue", size: 30.0))
            
            
            
            
            VStack {
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
            }
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            Spacer()
            
            
            HStack{
                Spacer()
                Button(action: {
                  self.sourceType = .camera
                  self.isImagePickerDisplay.toggle()
                }) {
                    Image(systemName: "camera")
                        .font(.system(size: 20))

                  Text("Camera").font(.headline)
                }
                .bold()
                .font(Font.custom("Helvetica Neue", size: 25.0))
                .padding(15)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(5)
                Spacer()
                Button(action: {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Photo library")
                            .font(.headline)
                    }
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 25.0))
                    .padding(15)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
                
                }
                Spacer()
            }
        }
        
        //    func buttonText() -> String {
        //        return image == nil ? "Add Picture" : "Change Picture"
        //}
    }
    
    //struct UploadProfilePicture_Previews: PreviewProvider {
    //    static var previews: some View {
    //        UploadProfilePicture()
    //    }
    //}
}
