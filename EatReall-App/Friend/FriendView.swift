//
//  FriendView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct FriendView: View {
    var body: some View {
      VStack{
        HStack{
          Image("logo").resizable()
            .frame(width: 115.0, height: 70.0)
          Spacer()
        }
          
        SearchFriendView()
        Spacer()
        navBar()
      }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
