//
//  notificationButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct notificationButton: View {
   // @State var buttonClicked : String = "home"
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        Button(action: {
            navBar.buttonClicked = "bell"
          viewRouter.currentPage = .notification
        }) {
            Image(navBar.buttonClicked == "bell" ? "bell-filled" : "bell-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
    }
}
