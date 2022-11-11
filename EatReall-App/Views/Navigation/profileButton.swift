//
//  profileButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct profileButton: View {
    @State var buttonClicked : String = "home"
    @State private var showProfileView = false
    var body: some View {
        Button(action: {
            self.buttonClicked = "profile";
            showProfileView = true
        }) {
            Image(self.buttonClicked == "profile" ? "profile-filled" : "profile-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
        NavigationLink("", destination:  ProfileView(), isActive: $showProfileView).navigationBarBackButtonHidden(true)
    }
}

struct profileButton_Previews: PreviewProvider {
    static var previews: some View {
        profileButton()
    }
}
