//
//  ContentView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

enum Page {
  case createProfile
  case home
  case notification
  case create
  case friend
  case profile
}

struct ContentView: View {
  
  @StateObject var viewRouter: ViewRouter
    
    var body: some View {
      switch viewRouter.currentPage {
        case .createProfile:
          CreateProfileView(viewRouter: viewRouter)
          
        case .home:
          HomeView(viewRouter: viewRouter)
          
        case .notification:
          NotificationView(viewRouter: viewRouter)
          
        case .create:
          FoodCameraView(viewRouter: viewRouter)
          
        case .friend:
          FriendView(viewRouter: viewRouter)
          
        case .profile:
          ProfileView(viewRouter: viewRouter)
          
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
