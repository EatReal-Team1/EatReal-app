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
  case login
  case postPreview
}

struct ContentView: View {
  @EnvironmentObject var viewModel: ViewModel
  @StateObject var viewRouter: ViewRouter
    
    var body: some View {
      switch viewRouter.currentPage {
        case .createProfile:
          CreateProfileView(viewRouter: viewRouter)
          
      case .login:
        LogInView(viewRouter: viewRouter, viewModel: viewModel)
          
        case .home:
          HomeView(viewRouter: viewRouter)
          
        case .notification:
          NotificationView(viewRouter: viewRouter)
          
        case .create:
//          FoodCameraView(viewRouter: viewRouter)
          CameraView(viewRouter: viewRouter)
          
        case .postPreview:
          PostPreviewView(viewRouter: viewRouter)
          
        case .friend:
          FriendView(viewRouter: viewRouter)
          
        case .profile:
          ProfileView(viewRouter: viewRouter, viewModel: viewModel)
          
      case .memory:
        MemoryView(viewRouter: viewRouter, viewModel: viewModel)
        
     case .search:
        SearchView(viewRouter: viewRouter, viewModel: viewModel)
          
      case .savedpost:
          SavedPostView(viewRouter: viewRouter)
          
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
