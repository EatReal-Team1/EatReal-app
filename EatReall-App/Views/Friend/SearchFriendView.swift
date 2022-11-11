//
//  SearchFriendView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct SearchFriendView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State private var username: String = ""
    
        var body: some View {
        VStack {
            TextField("Username", text: $username)
            Spacer()
            if !username.isEmpty {
            HStack{
                
                //Grab the information from that person
                Text(username)
                
                Spacer()
                Button(action: {
                  viewModel.currentUser.sendFriendRequest(to_user: username)
                  username = ""
                  viewModel.updateUser()
                }){
                    Text("Follow")
                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .padding(5)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(2)
                }
                }
            }
        Spacer()
        
            
        }
    }
}

struct SearchFriendView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendView()
    }
}
