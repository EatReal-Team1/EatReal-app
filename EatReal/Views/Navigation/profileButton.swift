//
//  profileButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct profileButton: View {
  //  @State var buttonClicked : String = "home"
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        Button(action: {
            navBar.buttonClicked = "profile";
          viewRouter.currentPage = .profile
        }) {
            Image(navBar.buttonClicked == "profile" ? "profile-filled" : "profile-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
    }
}
