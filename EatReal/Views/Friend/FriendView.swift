//
//  FriendView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct FriendView: View {
  @ObservedObject var viewRouter: ViewRouter
    var body: some View {
      VStack{
        Logo()
        SearchFriendView()
        Spacer()
        navBar(viewRouter: viewRouter)
      }
    }
}
