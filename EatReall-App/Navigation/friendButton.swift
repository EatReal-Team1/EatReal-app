//
//  friendButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct friendButton: View {
    @State var buttonClicked : String = "home"
    @State private var showFriendView = false
    var body: some View {
        Button(action: {
            self.buttonClicked = "friends";
            showFriendView = true
        }) {
            Image(self.buttonClicked == "friends" ? "friends-filled" : "friends-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
        NavigationLink("", destination:  FriendView(), isActive: $showFriendView).navigationBarBackButtonHidden(true)
    }
}

struct friendButton_Previews: PreviewProvider {
    static var previews: some View {
        friendButton()
    }
}
