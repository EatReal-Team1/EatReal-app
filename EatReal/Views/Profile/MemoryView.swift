//
//  MemoryView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/6/22.
//

import SwiftUI

struct MemoryView: View {
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {

        ScrollView() {
          VStack(spacing: 20) {
            ForEach (viewModel.myPosts()) { post in
              PostView(post: .constant(post))
            }
          }
        }

        navBar(viewRouter: viewRouter)
    }
}

//struct MemoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoryView()
//    }
//}
