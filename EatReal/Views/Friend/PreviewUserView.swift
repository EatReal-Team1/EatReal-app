//
//  PreviewUserView.swift
//  EatReal
//
//  Created by Leanne Sun on 12/6/22.
//

import SwiftUI

struct PreviewUserView: View {
  @Binding var user: User
  @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
      VStack {
        HStack{
          AsyncImage(url: user.profile_picture.url, type: "friendPreview")
          Text(user.display_name)
          Spacer()
        }.padding(20)
        
        Button(action: {viewModel.currentUser.sendFriendRequest(to_user: user)
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
      } // VStack
      
    } // body
}

//struct PreviewUserView_Previews: PreviewProvider {
//    static var previews: some View {
//      PreviewUserView(user: <#Binding<User>#>)
//    }
//}
