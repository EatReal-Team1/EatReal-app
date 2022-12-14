//
//  MemoryView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/6/22.
//

import SwiftUI

struct MemoryView: View {
    @ObservedObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        Logo()
        HStack{
            Button(action: {
                viewRouter.currentPage = .profile
            })
            {
                Text("Back")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 15.0))
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
            Spacer()
        }

        ScrollView() {
          VStack(spacing: 20) {
            ForEach (viewModel.getMyPost()) { post in
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
