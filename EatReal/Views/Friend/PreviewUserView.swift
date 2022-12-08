//
//  PreviewUserView.swift
//  EatReal
//
//  Created by Leanne Sun on 12/6/22.
//

import SwiftUI

struct PreviewUserView: View {
  @Binding var selfUser: User
  @Binding var user: User
  @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
      HStack{
        AsyncImage(url: user.profile_picture.url, type: "friendPreview")
        Text(user.display_name)
        Spacer()
        if (selfUser.following.contains(user.id)) {
          Text("Followed")
              .bold()
              .font(Font.custom("Helvetica Neue", size: 20))
              .padding(7)
              .foregroundColor(Color.white)
              .background(Color.black)
              .cornerRadius(4)
        } else if (selfUser.id == user.id) {
          Text("Me")
              .bold()
              .font(Font.custom("Helvetica Neue", size: 20))
              .padding(7)
              .foregroundColor(Color.white)
              .background(Color.black)
              .cornerRadius(4)
        } else {
          Button(action: {viewModel.currentUser.sendFriendRequest(to_user: user)
            viewModel.updateUser(id: viewModel.currentUser.id)
            viewModel.updateUser(id: user.id)
          }){
            Text("Follow")
              .bold()
              .font(Font.custom("Helvetica Neue", size: 20))
              .padding(7)
              .foregroundColor(Color.white)
              .background(Color.black)
              .cornerRadius(4)
          }
        }
        
      }.padding(20)
      
    } // body
}

//struct PreviewUserView_Previews: PreviewProvider {
//    static var previews: some View {
//      PreviewUserView(user: <#Binding<User>#>)
//    }
//}
