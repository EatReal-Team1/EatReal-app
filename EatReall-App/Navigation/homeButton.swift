//
//  homeButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct homeButton: View {
    @State var buttonClicked : String = "home"
    @State private var showHomeView = false
    var body: some View {
        Button(action: {
            self.buttonClicked = "home"
            showHomeView = true
        }) {
            Image(self.buttonClicked == "home" ? "home-filled" : "home-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
        NavigationLink("", destination:  HomeView(), isActive: $showHomeView).navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct homeButton_Previews: PreviewProvider {
    static var previews: some View {
        homeButton()
    }
}
