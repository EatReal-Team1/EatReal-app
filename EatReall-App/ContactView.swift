//
//  ContactView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/8/22.
//

import SwiftUI
import UIKit

struct AddContact: View {
  
  var viewModel: ViewModel
  
  @State var name: String = ""
  @State var phone: String = ""
  @State var email: String = ""
  
  @State var showImagePicker: Bool = false
  @State var image: UIImage? = nil
  
  var displayImage: Image? {
    if let picture = image {
      return Image(uiImage: picture)
    } else {
      return nil
    }
  }
  
  var body: some View {
    VStack {
      HStack {
        Text("name:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("full name", text: $name)
          .padding(.trailing)
      }.padding()
      HStack {
        Text("phone:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("phone number", text: $phone)
          .keyboardType(.phonePad)
          .padding(.trailing)
      }.padding()
      HStack {
        Text("email:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("email address", text: $email)
          .keyboardType(.emailAddress)
          .padding(.trailing)
      }.padding()
      displayImage?.resizable().scaledToFit().padding()
      Button(action: {
        self.showImagePicker = true
      }) {
        Text(buttonText())
      }.padding()
      Spacer()
    }
    .sheet(isPresented: $showImagePicker) {
      PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
    }
    .navigationBarTitle("New Contact")
    .navigationBarItems(trailing:
                          Button(action: {
      self.viewModel.saveContact(name: self.name, phone: self.phone, email: self.email, picture: self.image)
    }) {
      Text("Done")
    }
    )
  }
  
    // MARK: View Helper Functions
  func buttonText() -> String {
    return image == nil ? "Add Contact Picture" : "Change Contact Picture"
  }
}
