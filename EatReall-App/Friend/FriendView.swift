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
        Logo()
        
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
