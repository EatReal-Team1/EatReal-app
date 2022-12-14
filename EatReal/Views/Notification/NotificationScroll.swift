//
//  NotificationScroll.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct NotificationScroll: View {
  @EnvironmentObject var viewModel: ViewModel
  @ObservedObject var viewRouter: ViewRouter
  
    var body: some View {
      ScrollView() {
        VStack(spacing: 20) {
          ForEach (viewModel.getNeedReviewPosts()){ post in
            SingleNotificationView(viewModel: _viewModel, viewRouter: viewRouter, post: .constant(post))
          }
        }
      }
      .frame(height: 600)
    }
}

//struct NotificationScroll_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationScroll()
//    }
//}
