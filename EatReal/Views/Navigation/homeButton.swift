//
//  homeButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct homeButton: View {
    //@State var buttonClicked : String = "home"
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        Button(action: {
            navBar.buttonClicked = "home"
          viewRouter.currentPage = .home
        }) {
            Image(navBar.buttonClicked == "home" ? "home-filled" : "home-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
    }
}
