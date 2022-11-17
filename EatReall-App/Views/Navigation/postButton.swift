//
//  postButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct postButton: View {
    @State var buttonClicked : String = "home"
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        Button(action: {
            self.buttonClicked = "add";
          viewRouter.currentPage = .create
        }) {
            Image(self.buttonClicked == "add" ? "add-new-filled" : "add-new-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
    }
}
