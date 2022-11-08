//
//  ScrollView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct PostScroll: View {
    var body: some View {
      ScrollView() {
        VStack(spacing: 20) {
          ForEach(0..<10) {_ in
            PostView()
          }
        }
      }
      .frame(height: 600)
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
      PostScroll()
    }
}
