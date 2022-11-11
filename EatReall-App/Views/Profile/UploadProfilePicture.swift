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
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
            Text("Profile Picture").font(Font.custom("Helvetica Neue", size: 30.0))
         
                    Image(uiImage: self.image)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
         
                    Button(action: {
                        self.isShowPhotoLibrary = true
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
