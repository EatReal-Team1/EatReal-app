//
//  ContentView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
