//
//  navBar.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct navBar: View {

    var body: some View {
        
        HStack(alignment: .bottom) {
            
                homeButton()
                Spacer().frame(width: 35)
                notificationButton()
                Spacer().frame(width: 35)
                postButton()
                Spacer().frame(width: 35)
                friendButton()
                Spacer().frame(width: 35)
                profileButton()                
            }
        }
    }




struct navBar_Previews: PreviewProvider {
    static var previews: some View {
        navBar()
    }
}

