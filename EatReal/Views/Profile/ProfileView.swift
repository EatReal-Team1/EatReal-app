//
//  ProfileView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct ProfileView: View {
  @ObservedObject var viewRouter: ViewRouter
  @StateObject var viewModel: ViewModel
  //@StateObject var viewRouter: ViewRouter
  //@State private var showSavedPostPage = false
  //@State private var showMemoryPage = false
   
    var body: some View {
        
     //   NavigationView {
        VStack{
            Logo()
            Spacer()
            AsyncImage(url: viewModel.currentUser.profile_picture.url, type: "myProfile")
            Group{
                Text(" ")
                Text(viewModel.currentUser.display_name).font(Font.custom("Helvetica Neue", size: 40.0))
                Text("Username: " + viewModel.currentUser.username).font(Font.custom("Helvetica Neue", size: 20))
                Spacer()
            }
            
            
            Button(action: {
             //   showMemoryPage = true
                viewRouter.currentPage = .memory
            }) {
                Text("Memories").bold()
                    .font(Font.custom("Helvetica Neue", size: 25.0))
                    .padding(15)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
         
            Button(action: {
              //  showSavedPostPage = true
                viewRouter.currentPage = .savedpost
            }) {
                Text("Saved Posts").bold()
                    .font(Font.custom("Helvetica Neue", size: 25.0))
                    .padding(15)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
            // }
            //SavedPostView()
        }
                navBar(viewRouter: viewRouter)
            }
    }

