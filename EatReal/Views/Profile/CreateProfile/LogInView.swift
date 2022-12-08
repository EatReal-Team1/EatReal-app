//
//  LogInView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/8/22.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewRouter: ViewRouter
    @State public var username = ""
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        Logo()
        Spacer()
        
        Text("Username:")
        TextField("Username", text: $username)
        
        HStack{
            Spacer()
            Button(action: {
              
               // need to be done: find whether the person in the db
                viewModel.setCurrentUser(username: username)
                
                
              viewRouter.currentPage = .profile
                
                
                
            }) {
                Text("Log In").bold()
                    .font(Font.custom("Helvetica Neue", size: 25.0))
                    .padding(15)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
            Spacer().frame(width: 10)
            
        }
        
        Spacer()
        navBar(viewRouter: viewRouter)
    }
}

//

