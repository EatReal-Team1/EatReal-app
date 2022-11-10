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
    
    
    var body: some View {
        VStack{
            Text("Upload Profile Picture").font(Font.custom("Helvetica Neue", size: 30.0))
            //Button to upload picture
            // displayImage?.resizable().scaledToFit().padding()
            Button(action: {
                // self.showImagePicker = true
            }) {
                Text("Upload Picture")
            }.padding()
            Spacer()
            //        }
            //      .sheet(isPresented: $showImagePicker) {
            //        PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            //      }
            //      .navigationBarTitle("New Contact")
            //      .navigationBarItems(trailing:
            //        Button(action: {
            //          self.viewModel.saveContact(name: self.name, phone: self.phone, email: self.email, picture: self.image)
            //        }) {
            //          Text("Done")
            //        }
            //      )
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
