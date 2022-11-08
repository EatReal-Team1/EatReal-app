//
//  ProfileView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
      VStack{
          HStack{
              Image("logo").resizable()
                  .frame(width: 115.0, height: 70.0)
              Spacer()
          }
          Spacer()
         Image("Profile").resizable()
              .frame(width: 200, height: 200)
          Text(" ")
          Text("Leanne Sun").font(.system(size: 40))
          Text("Username: leannesxh14").font(.system(size: 20))
          Spacer()
         
        navBar()
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}