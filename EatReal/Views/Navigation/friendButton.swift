//
//  friendButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct friendButton: View {
    @State var buttonClicked : String = "home"
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        Button(action: {
            self.buttonClicked = "friends";
          viewRouter.currentPage = .friend
        }) {
            Image(self.buttonClicked == "friends" ? "friends-filled" : "friends-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
    }
}
