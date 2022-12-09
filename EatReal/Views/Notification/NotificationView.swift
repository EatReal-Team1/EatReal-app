//
//  NotificationView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct NotificationView: View {
  @ObservedObject var viewRouter: ViewRouter
  @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      VStack{
        Logo()
        NotificationScroll(viewModel: viewModel, viewRouter: viewRouter)
        Spacer()
        navBar(viewRouter: viewRouter)
      }
    }
}
