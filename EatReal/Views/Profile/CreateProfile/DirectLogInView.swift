//
//  DirectLogInView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/14/22.
//

import SwiftUI

struct DirectLogInView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State public var username = ""
    @State public var password = ""
    @EnvironmentObject var viewModel: ViewModel
    @State private var isSecured: Bool = true
    var body: some View {
        HStack{
            Spacer().frame(width: 160)
          //  Text("Username:")//.font(Font.custom("MarkerFelt-Thin", size: 20.0))
            Spacer()
        }
        HStack{
            Spacer().frame(width: 100)
            TextField("Username", text: $username) .textFieldStyle(.roundedBorder)
            Spacer().frame(width: 100)
        }
        HStack{
            Spacer().frame(width: 100)
          //  TextField("Password", text: $password) .textFieldStyle(.roundedBorder)
           
            
            ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("Password", text: $password).textFieldStyle(.roundedBorder)
                            } else {
                                TextField("Password", text: $password).textFieldStyle(.roundedBorder)
                            }
                        }.padding(.trailing, 32)

                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
            Spacer().frame(width: 68)
        }
        Spacer().frame(height: 50)
        
        
        HStack{
            Spacer()
            Button(action: {
                
              
               // need to be done: find whether the person in the db
                viewModel.setCurrentUser(username_ipt: username)
                
                print(viewModel.currentUser.display_name)
                viewRouter.currentPage = .profile
                navBar.buttonClicked = "profile"
                
            }) {
                Text("Log In").bold()
                    .font(Font.custom("Helvetica Neue", size: 20.0))
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(3)
            }
            Spacer()
            
        }
        
        Spacer()
    }
}
