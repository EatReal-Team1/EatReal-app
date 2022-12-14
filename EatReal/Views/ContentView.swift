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
  case search
  case memory
  case savedpost
  case signup
  case login
  case review
  case begin
}

struct ContentView: View {
  @EnvironmentObject var viewModel: ViewModel
  @StateObject var viewRouter: ViewRouter
  @ObservedObject var notificationManager = LocalNotificationManager()
    
    var body: some View {
      switch viewRouter.currentPage {
        case .createProfile:
          CreateProfileView(viewRouter: viewRouter)
          
      case .begin:
        CreateProfileView(viewRouter: viewRouter)
          
      case .login:
        LogInView(viewRouter: viewRouter)
          
      case .signup:
          SignUpView(viewRouter: viewRouter)
          
        case .home:
          HomeView(viewRouter: viewRouter)
          
        case .notification:
        NotificationView(viewRouter: viewRouter, viewModel: viewModel)
          
        case .create:
//          FoodCameraView(viewRouter: viewRouter)
          CameraView(viewRouter: viewRouter, notificationManager: notificationManager, restaurant: "")
          
        case .friend:
          FriendView(viewRouter: viewRouter)
          
        case .profile:
          ProfileView(viewRouter: viewRouter)
          
      case .memory:
        MemoryView(viewRouter: viewRouter)
        
     case .search:
        SearchView(viewRouter: viewRouter)
          
      case .savedpost:
          SavedPostView(viewRouter: viewRouter)
          
        case .review:
        ReactionCameraView(viewRouter: viewRouter)
          
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
