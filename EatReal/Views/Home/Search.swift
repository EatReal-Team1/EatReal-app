//
//  Search.swift
//  EatReal
//
//  Created by Leanne Sun on 12/1/22.
//

import SwiftUI

struct Search: View {
  @ObservedObject var viewRouter: ViewRouter
    var body: some View {
      Button(action: {
        viewRouter.currentPage = .search
      })
     {
       Image("search").resizable()
            .frame(width: 28.0, height: 28.0)
     }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
      Search(viewRouter: ViewRouter())
    }
}
