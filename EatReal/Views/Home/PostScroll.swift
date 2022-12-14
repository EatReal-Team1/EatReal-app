//
//  ScrollView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct PostScroll: View {

    @EnvironmentObject var viewModel: ViewModel

  var body: some View {
    NavigationView {
      ScrollView() {
        VStack(spacing: 20) {
          ForEach (viewModel.postList) { post in
            NavigationLink(destination: PostDetailView(post: .constant(post))) {
              PostView(post: .constant(post))
            }
          }
        }
      }
    }
  }
}
//
//struct ScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//      PostScroll()
//    }
//}
