//
//  navBar.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct navBar: View {
  @State var buttonClicked : String = "home"
    var body: some View {
      HStack(alignment: .bottom) {
        Button(action: {
          self.buttonClicked = "home"
        }) {
          Image(self.buttonClicked == "home" ? "home-filled" : "home-outline").resizable()
            .frame(width: 40.0, height: 40.0)
        }
        
        Spacer().frame(width: 35)
        
        Button(action: {
          self.buttonClicked = "bell"
        }) {
          Image(self.buttonClicked == "bell" ? "bell-filled" : "bell-outline").resizable()
            .frame(width: 40.0, height: 40.0)
        }
        
        Spacer().frame(width: 35)
        
        Button(action: {
          self.buttonClicked = "add"
        }) {
          Image(self.buttonClicked == "add" ? "add-new-filled" : "add-new-outline").resizable()
            .frame(width: 40.0, height: 40.0)
        }
        
        Spacer().frame(width: 35)
        
        Button(action: {
          self.buttonClicked = "friends"
        }) {
          Image(self.buttonClicked == "friends" ? "friends-filled" : "friends-outline").resizable()
            .frame(width: 40.0, height: 40.0)
        }
        
        Spacer().frame(width: 35)
        
        Button(action: {
          self.buttonClicked = "profile"
        }) {
          Image(self.buttonClicked == "profile" ? "profile-filled" : "profile-outline").resizable()
            .frame(width: 40.0, height: 40.0)
        }
        
      }
   }
}


struct navBar_Previews: PreviewProvider {
    static var previews: some View {
        navBar()
    }
}
