//
//  postButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct postButton: View {
    @State var buttonClicked : String = "home"
    @State private var showPostView = false
    var body: some View {
        Button(action: {
            self.buttonClicked = "add";
            showPostView = true
        }) {
            Image(self.buttonClicked == "add" ? "add-new-filled" : "add-new-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
        NavigationLink("", destination:  FoodCameraView(), isActive: $showPostView).navigationBarBackButtonHidden(true)
    }
}

struct postButton_Previews: PreviewProvider {
    static var previews: some View {
        postButton()
    }
}
