//
//  SignUpView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/14/22.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State public var name = ""
    @State public var username = ""
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        Logo()
        
        
        Spacer()
        Text("Create Profile").font(Font.custom("Helvetica Neue", size: 40.0)).bold()
        
        Divider().frame(width: 300).background(Color.black).frame(height: 5)
        Spacer().frame(height: 20)
        
        
        ScrollView(){
            
            UploadProfilePicture()
            
            Spacer().frame(height: 50)
            
            InputName(name: $name)
            
            Spacer().frame(height: 50)
            
            InputUsername(username: $username)
            
            Spacer().frame(height: 50)
            
            HStack{
                Spacer()
                Button(action: {
                    
                    // viewModel.saveUser(name: name, username: username)
                    viewRouter.currentPage = .profile
                    
                }) {
                    Text("Save").bold()
                        .font(Font.custom("Helvetica Neue", size: 25.0))
                        .padding(15)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(5)
                }
                Spacer().frame(width: 10)
            }
        }
        navBar(viewRouter: viewRouter)
    }}
