//
//  LandingView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/9/22.
//

import SwiftUI

struct LandingView: View {
  @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
  var body: some View {
    VStack{
      HStack{
        Image("logo").resizable()
          .frame(width: 115.0, height: 70.0)
        Spacer()
      }
        PostScroll(viewModel: viewModel)
      navBar(viewRouter: viewRouter)
    }
  }
}
