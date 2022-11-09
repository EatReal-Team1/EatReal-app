//
//  LandingView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/8/22.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
      VStack{
        HStack{
          Image("logo").resizable()
            .frame(width: 115.0, height: 70.0)
          Spacer()
        }
        PostScroll()
        navBar()
      }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
