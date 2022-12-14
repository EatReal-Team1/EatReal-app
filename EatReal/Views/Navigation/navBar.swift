//
//  navBar.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct navBar: View {
    @ObservedObject var viewRouter: ViewRouter
    static public var buttonClicked : String = ""
    var body: some View {
        HStack(alignment: .bottom) {
            
                homeButton(viewRouter: viewRouter)
                Spacer().frame(width: 35)
                notificationButton(viewRouter: viewRouter)
                Spacer().frame(width: 35)
                postButton(viewRouter: viewRouter)
                Spacer().frame(width: 35)
                friendButton(viewRouter: viewRouter)
                Spacer().frame(width: 35)
                profileButton(viewRouter: viewRouter)
            }
        }
    }
