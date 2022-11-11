//
//  notificationButton.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct notificationButton: View {
    @State var buttonClicked : String = "home"
    @State private var showNoficationView = false
    var body: some View {
        Button(action: {
            self.buttonClicked = "bell"
            showNoficationView = true
        }) {
            Image(self.buttonClicked == "bell" ? "bell-filled" : "bell-outline").resizable()
                .frame(width: 40.0, height: 40.0)
        }
        NavigationLink("", destination:  NotificationView(), isActive: $showNoficationView) .navigationBarBackButtonHidden(true)
    }
}

struct notificationButton_Previews: PreviewProvider {
    static var previews: some View {
        notificationButton()
    }
}
