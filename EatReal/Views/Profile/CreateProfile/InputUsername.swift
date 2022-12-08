//
//  InputUsername.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/10/22.
//

import SwiftUI

struct InputUsername: View {
    @Binding var username: String
    var body: some View {
        Text("Username").font(Font.custom("Helvetica Neue", size: 30.0))
        HStack{
            Spacer()
            TextField("Username", text: $username)
            Spacer()
        }
    }
}
//
//struct InputUsername_Previews: PreviewProvider {
//    static var previews: some View {
//        InputUsername()
//    }
//}
