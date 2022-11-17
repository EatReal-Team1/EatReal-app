//
//  NotificationView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct NotificationView: View {
  @StateObject var viewRouter: ViewRouter
  
    var body: some View {
      VStack{
        Logo()
        NotificationScroll()
        navBar(viewRouter: viewRouter)
      }
    }
}
