//
//  ProfileView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewRouter: ViewRouter
  //  @StateObject var viewRouter: ViewRouter
    //@State private var showSavedPostPage = false
  //  @State private var showMemoryPage = false
   
    
    var body: some View {
        
     //   NavigationView {
            
        VStack{
            Logo()
            Spacer()
            Image("Profile").resizable()
                .frame(width: 200, height: 200)
            Group{
                Text(" ")
                Text("Leanne Sun").font(Font.custom("Helvetica Neue", size: 40.0))
                Text("Username: leannesxh14").font(Font.custom("Helvetica Neue", size: 20))
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

