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
                Logo()
                Spacer()
                Image("Profile").resizable()
                    .frame(width: 200, height: 200)
                Text(" ")
                Text("Leanne Sun").font(Font.custom("Helvetica Neue", size: 40.0))
                Text("Username: leannesxh14").font(Font.custom("Helvetica Neue", size: 20))
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
